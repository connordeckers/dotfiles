-- Notification library
local awful = require 'awful'
local naughty = require 'naughty'
local inspect = require 'inspect'
local ruled = require 'ruled'

local config = require 'patch.config'

local M = {}

function M.debug(text, title, urgency)
  return naughty.notification {
    urgency = urgency or 'info',
    title = title or 'DebugMsg',
    message = type(text) == 'text' and text or inspect(text),
  }
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

return M
