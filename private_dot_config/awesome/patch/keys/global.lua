local config = require 'patch.config'
local utils = require 'patch.utils'
local awful = require 'awful'
local gears = require 'gears'

local layout = {
  -- Layout manipulation
  {
    mods = { config.modkey, 'Shift' },
    key = 'j',
    action = function()
      awful.client.swap.byidx(1)
    end,
    description = 'swap with next client by index',
    group = 'client',
  },
  {
    mods = { config.modkey, 'Shift' },
    key = 'k',
    action = function()
      awful.client.swap.byidx(-1)
    end,
    description = 'swap with previous client by index',
    group = 'client',
  },

  {
    mods = { config.modkey },
    key = 'l',
    action = function()
      awful.tag.incmwfact(0.05)
    end,
    description = 'increase master width factor',
    group = 'layout',
  },
  {
    mods = { config.modkey },
    key = 'h',
    action = function()
      awful.tag.incmwfact(-0.05)
    end,
    description = 'decrease master width factor',
    group = 'layout',
  },
  {
    mods = { config.modkey, 'Shift' },
    key = 'h',
    action = function()
      awful.tag.incnmaster(1, nil, true)
    end,
    description = 'increase the number of master clients',
    group = 'layout',
  },
  {
    mods = { config.modkey, 'Shift' },
    key = 'l',
    action = function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    description = 'decrease the number of master clients',
    group = 'layout',
  },
  {
    mods = { config.modkey, 'Control' },
    key = 'h',
    action = function()
      awful.tag.incncol(1, nil, true)
    end,
    description = 'increase the number of columns',
    group = 'layout',
  },
  {
    mods = { config.modkey, 'Control' },
    key = 'l',
    action = function()
      awful.tag.incncol(-1, nil, true)
    end,
    description = 'decrease the number of columns',
    group = 'layout',
  },
  {
    mods = { config.modkey },
    key = 'space',
    action = function()
      awful.layout.inc(1)
    end,
    description = 'select next',
    group = 'layout',
  },
  {
    mods = { config.modkey, 'Shift' },
    key = 'space',
    action = function()
      awful.layout.inc(-1)
    end,
    description = 'select previous',
    group = 'layout',
  },
}

local navigation = {
  { mods = { config.modkey }, key = 'Left', action = awful.tag.viewprev, description = 'view previous', group = 'tag' },
  { mods = { config.modkey }, key = 'Right', action = awful.tag.viewnext, description = 'view next', group = 'tag' },

  {
    mods = { config.modkey },
    key = 'j',
    action = function()
      awful.client.focus.byidx(1)
    end,
    description = 'focus next by index',
    group = 'client',
  },

  {
    mods = { config.modkey },
    key = 'k',
    action = function()
      awful.client.focus.byidx(-1)
    end,
    description = 'focus previous by index',
    group = 'client',
  },

  {
    mods = { config.modkey, 'Control' },
    key = 'j',
    action = function()
      awful.screen.focus_relative(1)
    end,
    description = 'focus the next screen',
    group = 'screen',
  },
  {
    mods = { config.modkey, 'Control' },
    key = 'k',
    action = function()
      awful.screen.focus_relative(-1)
    end,
    description = 'focus the previous screen',
    group = 'screen',
  },

  { mods = { config.modkey }, key = 'u', action = awful.client.urgent.jumpto, description = 'jump to urgent client', group = 'client' },

  {
    mods = { config.modkey },
    key = 'Tab',
    action = function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    description = 'go back',
    group = 'client',
  },

  {
    mods = { config.modkey, 'Control' },
    key = 'n',
    action = function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal('request::activate', 'key.unminimize', { raise = true })
      end
    end,
    description = 'restore minimized',
    group = 'client',
  },
}

local applications = {
  {
    mods = { config.modkey },
    key = 'Escape',
    action = function()
      awful.spawn(config.terminal)
    end,
    description = 'open a terminal',
    group = 'terminal',
  },
  {
    mods = { config.modkey },
    key = 'Return',
    action = utils.scratchpad,
    description = 'toggle a floating scratchpad',
    group = 'terminal',
  },

  {
    mods = {},
    key = 'Print',
    action = function()
      awful.spawn(config.screenshot)
    end,
    description = 'Take a screenshot',
    group = 'screen',
  },

  -- Menubar
  -- { mods = { config.modkey, 'Shift' }, key = 'p', action = menubar.show,  description = 'show the menubar', group = 'launcher' },
  {
    mods = { config.modkey },
    key = 'd',
    action = function()
      awful.spawn(config.launcher)
    end,
    description = 'run dmenu',
    group = 'launcher',
  },
}

local management = {
  {
    mods = { config.modkey },
    key = 's',
    action = require('patch.hotkeys').show,
    description = 'show help',
    group = 'awesome',
  },
  {
    mods = { 'Shift', 'Mod1' },
    key = 'r',
    action = awesome.restart,
    description = 'reload awesome',
    group = 'awesome',
  },
  {
    mods = { config.modkey, 'Control', 'Shift' },
    key = 'q',
    action = awesome.quit,
    description = 'quit awesome',
    group = 'awesome',
  },
  -- {
  --   mods = { config.modkey },
  --   key = 'r',
  --   action = function()
  --     awful.screen.focused().mypromptbox:run()
  --   end,
  --   description = 'run prompt',
  --   group = 'launcher',
  -- },

  -- {
  --   mods = { config.modkey },
  --   key = 'x',
  --   action = function()
  --     awful.prompt.run {
  --       prompt = 'Run Lua code: ',
  --       textbox = awful.screen.focused().mypromptbox.widget,
  --       exe_callback = awful.util.eval,
  --       history_path = awful.util.get_cache_dir() .. '/history_eval',
  --     }
  --   end,
  --   description = 'lua execute prompt',
  --   group = 'awesome',
  -- },
}

local keys = gears.table.join(layout, navigation, applications, management)
return keys
