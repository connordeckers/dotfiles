local config = require 'patch.config'

local awful = require 'awful'
local menubar = require 'menubar'
local wibox = require 'wibox'

-- Tell the menubar what terminal to use when running a shell command
menubar.utils.terminal = config.terminal

-- Set up the default args of the prompt when it opens
menubar.prompt_args = {
  prompt = 'Search: ',
  textbox = wibox.widget {
    widget = wibox.widget.textbox,
    halign = 'center',
    valign = 'center',
  },
}

-- Display the overlay on top of the bar
local margin = config.theme.margin + 2
menubar.geometry = {
  height = config.theme.menubar_height,
  width = screen[awful.screen.focused()].workarea.width - (margin * 2),
  x = margin,
  y = margin,
}
