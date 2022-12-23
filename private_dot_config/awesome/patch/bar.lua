local awful = require 'awful'
local wibox = require 'wibox'
local gears = require 'gears'
local beautiful = require 'beautiful'
local config = require 'patch.config'
local logout_menu = require 'patch.widgets.logout'
local utils = require 'patch.utils'

-- Wibar
-- Create a textclock widget
local mytextclock = wibox.widget {
  format = '%a %b %d %Y, %H:%M',
  widget = wibox.widget.textclock,
}
local tray = wibox.widget {
  wibox.widget.systray(),
  valign = 'center',
  halign = 'center',
  widget = wibox.container.place,
}
tray.widget.base_size = config.theme.menubar_height * 0.6

local widget_spacer = wibox.widget.textbox(string.rep('  ', 2))

local focused_name = wibox.widget {
  markup = client.focus and client.focus.name or '',
  widget = wibox.widget.textbox,
  halign = 'center',
  valign = 'center',
}

local function update_window_name(c)
  focused_name.text = c and c.name or ''
end

client.connect_signal('focus', update_window_name)
client.connect_signal('unfocus', update_window_name)
client.connect_signal('property::name', update_window_name)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),
  awful.button({ config.modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),

  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ config.modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),

  awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
  end),

  awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == 'function' then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

local function tags(count, val)
  local tbl = {}
  for tag = 1, count do
    table.insert(tbl, val or tag)
  end
  return tbl
end

local function draw_bar(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag(tags(10, ' '), s, awful.layout.layouts[1])
  -- awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- We need one layoutbox per screen.
  s.mylayoutbox = wibox.widget {
    awful.widget.layoutbox {
      screen = s,
      buttons = gears.table.join(
        awful.button({}, 1, function()
          awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
          awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
          awful.layout.inc(1)
        end),
        awful.button({}, 5, function()
          awful.layout.inc(-1)
        end)
      ),
    },
    margins = {
      left = 0,
      right = 5,
      top = 5,
      bottom = 5,
    },
    widget = wibox.container.margin,
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = 'top',
    screen = s,
    height = config.theme.menubar_height,
    margins = gears.table.join(config.theme.menubar_margins, { bottom = 0 }),
  }

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      {
        s.mytaglist,
        margins = { left = 5, right = 5 },
        widget = wibox.container.margin,
      },
      s.mypromptbox,
    },
    focused_name,
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      tray,
      widget_spacer,
      mytextclock,
      logout_menu(),
      s.mylayoutbox,
    },
  }
end

awful.screen.connect_for_each_screen(draw_bar)
