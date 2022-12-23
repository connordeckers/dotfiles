local config = require 'patch.config'
local awful = require 'awful'

local keys = {
  {
    mods = { config.modkey },
    key = 'f',
    action = function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    description = 'toggle fullscreen',
    group = 'client',
  },

  {
    mods = { config.modkey, 'Shift' },
    key = 'q',
    action = function(c)
      c:kill()
    end,
    description = 'close',
    group = 'client',
  },

  {
    mods = { config.modkey, 'Control' },
    key = 'space',
    action = awful.client.floating.toggle,
    description = 'toggle floating',
    group = 'client',
  },

  {
    mods = { config.modkey, 'Control' },
    key = 'Return',
    action = function(c)
      c:swap(awful.client.getmaster())
    end,
    description = 'move to master',
    group = 'client',
  },

  {
    mods = { config.modkey },
    key = 'o',
    action = function(c)
      c:move_to_screen()
    end,
    description = 'move to screen',
    group = 'client',
  },

  {
    mods = { config.modkey },
    key = 't',
    action = function(c)
      c.ontop = not c.ontop
    end,
    description = 'toggle keep on top',
    group = 'client',
  },

  -- {
  --   mods = { config.modkey },
  --   key = 'n',
  --   action = function(c)
  --     -- The client currently has the input focus, so it cannot be
  --     -- minimized, since minimized clients can't have the focus.
  --     c.minimized = true
  --   end,
  --   description = 'minimize',
  --   group = 'client',
  -- },

  {
    mods = { config.modkey },
    key = 'm',
    action = function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    description = 'toggle maximized state',
    group = 'client',
  },
  {
    mods = { config.modkey, 'Control' },
    key = 'm',
    action = function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    description = 'toggle maximize vertically',
    group = 'client',
  },
  {
    mods = { config.modkey, 'Shift' },
    key = 'm',
    action = function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    description = 'toggle maximize horizontally',
    group = 'client',
  },
}

return keys
