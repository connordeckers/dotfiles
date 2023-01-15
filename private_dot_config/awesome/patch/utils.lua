-- Notification library
local awful = require 'awful'
local naughty = require 'naughty'
local inspect = require 'inspect'
local ruled = require 'ruled'
local gears = require 'gears'
local pango = require('lgi').Pango
local beautiful = require 'beautiful'

local config = require 'patch.config'
local deferred = require 'deferred'

local M = {}

function M.debug(text, title, urgency)
  return naughty.notification {
    -- urgency = urgency or 'info',
    title = title or 'DebugMsg',
    message = type(text) == 'text' and text or inspect(text),
    timeout = 0,
  }
end

function M.fdebug(text, fout)
  fout = fout or '/tmp/awesome.user.log'
  local fh = io.open(fout, 'a+')
  if not fh then
    error('Unable to open file handle at ' .. fout)
  end

  fh:write(type(text) == 'text' and text or inspect(text))
  fh:write '\n'
  fh:close()
end

--- Returns an iterator to cycle through clients.
--
-- Starting from the client in focus or the given index, all clients that match
-- a given criteria.
--
-- @tparam function filter A function that returns true to indicate a positive match.
-- @tparam integer start What index to start iterating from.  Defaults to using the
--   index of the currently focused client.
-- @tparam[opt=nil] screen s Which screen to use.  nil means all screens.
-- @treturn function A Lua iterator (to use in a `for` loop).
-- @staticfct awful.client.iterate
-- @usage -- un-minimize all urxvt instances
-- local urxvt = function (c)
--   return ruled.client.match(c, {class = "URxvt"})
-- end
--
-- for c in awful.client.iterate(urxvt) do
--   c.minimized = false
-- end
function M.find_client(rules)
  local matching_clients = {}
  local function filter(c)
    return ruled.client.match(c, rules)
  end

  for c in awful.client.iterate(filter) do
    table.insert(matching_clients, c)
  end
  return matching_clients
end

function M.hide_scratchpad()
  -- Our scratchpad name.
  -- Save it once, reference it everywhere!
  local class = 'scratchpad'

  -- Our existing scratchpad, if it exists. Nil otherwise.
  local existing = table.unpack(M.find_client { instance = class })

  -- If we have an existing scratchpad
  if existing then
    -- Toggle the hidden status of the scratchpad
    existing.hidden = true
  end
end

function M.scratchpad()
  -- Our scratchpad name.
  -- Save it once, reference it everywhere!
  local class = 'scratchpad'

  -- Our existing scratchpad, if it exists. Nil otherwise.
  local existing = table.unpack(M.find_client { class = class })

  -- If we have an existing scratchpad
  if existing then
    -- Toggle the hidden status of the scratchpad
    existing.hidden = not existing.hidden

    -- If its not hidden anymore, then jump focus into it
    if not existing.hidden then
      existing:jump_to()
    else
      -- If its just become hidden, find the last two most recent entries in the history stack.
      -- 		If the most recent one is the scratchpad, then focus the second most recent element.
      -- 		Otherwise, focus the most recent one.
      --
      -- This logic flow accounts for what happens when we toggle the scratchpad whilst focused on
      -- another window. We don't want to make the cursor jump around wildly!

      local most_recent, second_most_recent = table.unpack(awful.client.focus.history.list)
      local jump_target = most_recent ~= existing and most_recent or second_most_recent

      -- Make sure we didn't unfocus to an empty page.
      if jump_target then
        jump_target:jump_to()
      end
    end
  else
    -- If the scratchpad doesn't exist or can't be found,
    -- create a new instance of it. This is where we can
    -- easily manage its properties, like:
    --
    --  		- floating state
    --  		- placement on the screen
    --  		- whether it will appear on all tags/workspaces
    --  		- whether it gains focus when created
    --  		- whether it always appears on top
    --  		- whether it will appear in the taskbar
    --
    --  These offer the same options as `ruled.client`.
    --  We can also set the geometry, but for now this should be fine.
    awful.spawn(config.terminal .. ' --class ' .. class, {
      floating = true,
      placement = awful.placement.centered,
      sticky = true,
      focus = true,
      ontop = true,
      skip_taskbar = true,
    })
  end
end

--[[ ---@field style? normal The new font style
---@field variant? number The new font variant
---@field stretch? number The new font stretch ]]

---@class FontChange
---@field size? number The new font size
---@field font_family? string The new font family
---@field weight? number The new font weight
---@field size_multiplier? number The font size multiplier

---@param changes FontChange
function M.edit_font(changes)
  changes = changes or {}

  changes.size = changes.size or nil
  changes.font_family = changes.font_family or nil
  -- changes.style = changes.style or nil
  -- changes.variant = changes.variant or nil
  changes.weight = changes.weight or nil
  -- changes.stretch = changes.stretch or nil

  changes.base_font = changes.base_font or beautiful.font
  changes.size_multiplier = changes.size_multiplier or 1

  local font = pango.FontDescription.from_string(changes.base_font)

  if changes.size then
    font:set_size(changes.size)
  end
  if changes.font_family then
    font:set_family(changes.font_family)
  end
  if changes.weight then
    font:set_weight(changes.weight)
  end
  -- if changes.style then font:set_style(changes.style) end
  -- if changes.variant then font:set_variant(changes.variant) end
  -- if changes.stretch then font:set_stretch(changes.stretch) end

  font:set_size(font:get_size() * changes.size_multiplier)

  return font:to_string()
end

M.screen = {}

local function exec(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read '*a')
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local screens = nil
function M.screen.brightness(change)
  screens = screens or exec [[
		/usr/bin/ddcutil --sleep-multiplier 0.1 detect -t | grep "/dev/i2c" | awk -F- '{ print $2 }'
	]]

  if type(change) ~= 'number' then
    return
  end
  if change == 0 then
    return
  end

  local sign = change < 0 and '-' or '+'
  local count = math.abs(change)

  local cmd_base = {
    '/usr/bin/ddcutil',
    -- '--sleep-multiplier 0.5',
    'setvcp 10',
    '-b',
  }

  for screen in screens:gmatch '%d+' do
    local cmd = table.concat(gears.table.join(cmd_base, { screen, sign, count }), ' ')
    awful.spawn.with_shell(cmd)
    -- M.debug { cmd = cmd }
  end
end

M.table = {}
function M.table.find(collection, predicate)
  if type(collection) ~= 'table' then
    return nil
  end

  for index, value in pairs(collection) do
    if predicate(value, index, collection) then
      return value, index
    end
  end

  return nil
end

function M.table.filter(collection, predicate)
  if type(collection) ~= 'table' then
    return {}
  end

  local filtered = {}

  for index, value in pairs(collection) do
    if predicate(value, index, collection) then
      table.insert(filtered, value)
    end
  end

  return filtered
end

return M
