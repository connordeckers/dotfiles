----------------------------------------
--  		Rose-Pine AwesomeWM theme  		--
--  By Connor Deckers (connordeckers) --
----------------------------------------

local gears = require 'gears'
local g_color = require 'gears.color'
local dpi = require('beautiful.xresources').apply_dpi
local palettes = require 'patch.themes.rose-pine.variants'

-- Main
local M = {}

---@param palette 'main' | 'moon' | 'dawn'
function M.palette(palette)
  palette = palette or 'main'
  return palettes[palette]
end

---@param args { palette: 'main' | 'moon' | 'dawn', additions: table<string,string|number|boolean>, highlight: 'love' | 'gold' | 'rose' | 'pine' | 'foam' | 'iris', opacity: number }
function M.setup(args)
  local palette = args.palette or 'main'
  local additions = args.additions or {}
  local highlight = args.highlight or 'foam'
  local opacity = args.opacity or 1.0
  local colors = palettes[palette]

  local theme = {
    meta = {
      opacity = opacity,
      highlight = highlight,
      palette_name = palette,
      palette = colors,
    },
  }

  local function rgba(color)
    local alpha = g_color.change_opacity(color, opacity)
    return g_color.to_rgba_string(alpha)
  end

  local hl = rgba(colors[highlight])

  -- Colors
  theme.fg_normal = rgba(colors.subtle)
  theme.fg_focus = rgba(colors.text)
  theme.fg_urgent = hl

  theme.bg_normal = rgba(colors.base)
  theme.bg_focus = rgba(colors.surface)
  theme.bg_urgent = rgba(colors.highlight_high)
  theme.bg_systray = theme.bg_normal

  -- Borders
  theme.useless_gap = dpi(5)
  theme.border_width = dpi(1)
  theme.border_normal = '#3F3F3F'
  theme.border_focus = '#6F6F6F'
  theme.border_marked = '#CC9393'

  -- Titlebars
  theme.titlebar_bg_focus = rgba(colors.highlight_high)
  theme.titlebar_bg_normal = rgba(colors.highlight_low)

  -- There are other variable sets
  -- overriding the default one when
  -- defined, the sets are:
  -- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
  -- titlebar_[normal|focus]
  -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
  -- Example:
  --theme.taglist_bg_focus = "#CC9393"

  theme.taglist_bg_normal = theme.bg_normal
  theme.taglist_bg_focus = hl
  theme.taglist_bg_urgent = rgba(colors.love)
  theme.taglist_bg_occupied = rgba(colors.highlight_high)

  theme.taglist_shape = gears.shape.circle
  theme.taglist_shape_border_width = dpi(1)
  theme.taglist_shape_border_color = rgba(colors.highlight_high)

  theme.taglist_spacing = theme.useless_gap

  -- Mouse finder
  theme.mouse_finder_color = hl

  return gears.table.join(theme, additions)
end

return M
