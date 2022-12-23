-- Theme handling library
local gears = require 'gears'
local beautiful = require 'beautiful'
local theme = require 'patch.themes.rose-pine'
local config = require 'patch.config'
local icons = require 'patch.themes.icons'
local dpi = require('beautiful.xresources').apply_dpi
local utils = require 'patch.utils'

-- Themes define colours, icons, font and wallpapers.
local function apply_theme()
  -- The spacing around windows and other UI components
  local padding = dpi(3)

  local changes = gears.table.join(icons, {
    -- The gap between windows
    margin = padding,
    useless_gap = padding,

    -- Use our own wallpaper
    wallpaper = string.format('%s/Pictures/wallpapers/.wallpaper', os.getenv 'HOME'),

    -- Set a nice font to look at
    font = 'JetBrainsMono NF 8',

    -- The systray icon spacing
    systray_icon_spacing = 10,

    -- Drop our borders, it's prettier this way
    border_width = dpi(0),

    -- The height of our menu bar
    menubar_height = dpi(24),

    -- The spacing around our menu bar
    menubar_margins = { top = padding * 2, bottom = padding * 2, left = padding * 2, right = padding * 2 },
  })

  beautiful.init(theme.setup {
    palette = 'moon',
    additions = changes,
    highlight = 'iris',
    opacity = 0.8,
  })

  config.theme = beautiful.get()
end

screen.connect_signal('property::geometry', apply_theme)
apply_theme()