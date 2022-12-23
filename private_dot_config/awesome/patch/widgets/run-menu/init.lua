local exports = {}

local awful = require 'awful'
local config = require 'patch.config'
local menubar = require 'menubar'
local wibox = require 'wibox'
local gfs = require 'gears.filesystem'

local function get_screen(s)
  return s and screen[s]
end

local current_item = 1
local previous_item = nil
local current_category = nil
local shownitems = nil
local instance = nil

local function load_count_table()
  if instance.count_table then
    return instance.count_table
  end
  instance.count_table = {}
  local count_file_name = gfs.get_cache_dir() .. '/menu_count_file'
  local count_file = io.open(count_file_name, 'r')
  if count_file then
    for line in count_file:lines() do
      local name, count = string.match(line, '([^;]+);([^;]+)')
      if name ~= nil and count ~= nil then
        instance.count_table[name] = count
      end
    end
    count_file:close()
  end
  return instance.count_table
end

local function write_count_table(count_table)
  count_table = count_table or instance.count_table
  local count_file_name = gfs.get_cache_dir() .. '/menu_count_file'
  local count_file = assert(io.open(count_file_name, 'w'))
  for name, count in pairs(count_table) do
    local str = string.format('%s;%d\n', name, count)
    count_file:write(str)
  end
  count_file:close()
end
local function perform_action(o)
  if not o then
    return
  end
  if o.key then
    current_category = o.key
    local new_prompt = shownitems[current_item].name .. ': '
    previous_item = current_item
    current_item = 1
    return true, '', new_prompt
  elseif shownitems[current_item].cmdline then
    awful.spawn(shownitems[current_item].cmdline)
    -- load count_table from cache file
    local count_table = load_count_table()
    -- increase count
    local curname = shownitems[current_item].name
    count_table[curname] = (count_table[curname] or 0) + 1
    -- write updated count table to cache file
    write_count_table(count_table)
    -- Let awful.prompt execute dummy exec_callback and
    -- done_callback to stop the keygrabber properly.
    return false
  end
end
local function prompt_keypressed_callback(mod, key, comm)
  if key == 'Left' or (mod.Control and key == 'j') then
    current_item = math.max(current_item - 1, 1)
    return true
  elseif key == 'Right' or (mod.Control and key == 'k') then
    current_item = current_item + 1
    return true
  elseif key == 'BackSpace' then
    if comm == '' and current_category then
      current_category = nil
      current_item = previous_item
      return true, nil, 'Run: '
    end
  elseif key == 'Escape' then
    if current_category then
      current_category = nil
      current_item = previous_item
      return true, nil, 'Run: '
    end
  elseif key == 'Home' then
    current_item = 1
    return true
  elseif key == 'End' then
    current_item = #shownitems
    return true
  elseif key == 'Return' or key == 'KP_Enter' then
    if mod.Control then
      current_item = #shownitems
      if mod.Mod1 then
        -- add a terminal to the cmdline
        shownitems[current_item].cmdline = menubar.utils.terminal .. ' -e ' .. shownitems[current_item].cmdline
      end
    end
    return perform_action(shownitems[current_item])
  end
  return false
end

function exports.show(scr)
  scr = get_screen(scr or awful.screen.focused() or 1)
  local theme = {
    fg_color = config.theme.menubar_fg_normal or config.theme.menu_fg_normal or config.theme.fg_normal,
    bg_color = config.theme.menubar_bg_normal or config.theme.menu_bg_normal or config.theme.bg_normal,
    border_width = config.theme.menubar_border_width or config.theme.menu_border_width or 0,
    border_color = config.theme.menubar_border_color or config.theme.menu_border_color,
    font = config.theme.menubar_font or config.theme.font or 'Monospace 10',
  }

  -- If we haven't created it before, lets spin it up
  if not instance then
    -- Add to each category the name of its key in all_categories
    for k, v in pairs(menubar.menu_gen.all_categories) do
      v.key = k
    end

    if menubar.cache_entries then
      menubar.refresh(scr)
    end

    instance = {
      wibox = wibox {
        ontop = true,
        bg = theme.bg_color,
        fg = theme.fg_color,
        border_width = theme.border_width,
        border_color = theme.border_color,
        font = theme.font,
      },
      widget = wibox.layout.fixed.horizontal(),
      prompt = awful.widget.prompt(),
      query = nil,
      count_table = nil,
      font = theme.font,
    }

    local layout = wibox.layout.fixed.horizontal()
    layout:add(instance.prompt)
    layout:add(instance.widget)
    instance.wibox:set_widget(layout)
  end

  -- Menu already shown, exit
  if instance.wibox.visible then
    return
  elseif not menubar.cache_entries then
    menubar.refresh(scr)
  end

  -- Set position and size
  local scrgeom = scr.workarea
  local geometry = menubar.geometry
  instance.geometry = {
    x = geometry.x or scrgeom.x,
    y = geometry.y or scrgeom.y,
    height = geometry.height or require('gears.math').round(require('beautiful').get_font_height(theme.font) * 1.5),
    width = (geometry.width or scrgeom.width) - theme.border_width * 2,
  }
  instance.wibox:geometry(instance.geometry)

  local default_prompt_args = {
    prompt = 'Run: ',
    textbox = instance.prompt.widget,
    completion_callback = awful.completion.shell,
    history_path = gfs.get_cache_dir() .. '/history_menu',
    done_callback = menubar.hide,
    changed_callback = function(query)
      instance.query = query
      -- menulist_update(scr)
    end,
    keypressed_callback = prompt_keypressed_callback,
  }

  awful.prompt.run(setmetatable(menubar.prompt_args, { __index = default_prompt_args }))

  instance.wibox.visible = true
end

return exports
