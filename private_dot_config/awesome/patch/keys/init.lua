local key_utils = require 'patch.keys.utils'
local config = require 'patch.config'
local gears = require 'gears'
local awful = require 'awful'

local global = require 'patch.keys.global'
local client = require 'patch.keys.client'
local features = require 'patch.keys.features'

local keys = {
  client = {
    keys = key_utils.collection(client),

    -- Handle mouse button clicks.
    -- Not presently handled with a cleaner format, as the boilerplate
    -- would outweigh the code here.
    --
    -- If it gets to be more involved, I'll add something then.
    buttons = gears.table.join(
      awful.button({}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
      end),
      awful.button({ config.modkey }, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.move(c)
      end),
      awful.button({ config.modkey }, 3, function(c)
        c:emit_signal('request::activate', 'mouse_click', { raise = true })
        awful.mouse.client.resize(c)
      end)
    ),
  },
}

root.keys(key_utils.collection(global, features))

return keys
