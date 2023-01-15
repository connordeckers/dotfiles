local awful = require 'awful'
local beautiful = require 'beautiful'
local naughty = require 'naughty'
local wibox = require 'wibox'

naughty.connect_signal('request::display', function(n)
  -- n.title = string.format('<b>%s</b>', n.title, 'haha')
  -- n.widget_template = {
  --   {
  --     {
  --       {
  --         {
  --           naughty.widget.icon,
  --           {
  --             naughty.widget.title,
  --             naughty.widget.message,
  --             spacing = 4,
  --             layout = wibox.layout.fixed.vertical,
  --           },
  --           fill_space = true,
  --           spacing = 4,
  --           layout = wibox.layout.fixed.horizontal,
  --         },
  --         naughty.list.actions,
  --         spacing = 10,
  --         layout = wibox.layout.fixed.vertical,
  --       },
  --       margins = beautiful.notification_margin or 10,
  --       widget = wibox.container.margin,
  --     },
  --
  --     id = 'background_role',
  --     widget = naughty.container.background,
  --   },
  --   strategy = 'max',
  --   width = beautiful.notification_max_width or beautiful.xresources.apply_dpi(500),
  --   widget = wibox.container.constraint,
  -- }

  naughty.layout.box {
    notification = n,
  }
end)

-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

client.connect_signal('focus', function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal('unfocus', function(c)
  c.border_color = beautiful.border_normal
end)
