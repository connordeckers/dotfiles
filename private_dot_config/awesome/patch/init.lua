-- Personal configuration for Awesome WM

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

require 'patch.error_handling'
require 'patch.layouts'

local utils = require 'patch.utils'

require 'patch.theme'
require 'patch.signals'
require 'patch.keys'
require 'patch.rules'
require 'patch.autostart'

-- require 'patch.widgets'

require 'patch.bar'
require 'patch.menubar'

-- Once we've found our clients, hide our scratchpad if it exists
client.connect_signal('scanned', utils.hide_scratchpad)
