-- Personal configuration for Awesome WM

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

require 'patch.error_handling'
require 'patch.layouts'

require 'patch.theme'
require 'patch.signals'
require 'patch.keys'
require 'patch.rules'
require 'patch.autostart'

require 'patch.menubar'

-- Once we've found our clients, hide our scratchpad if it exists
client.connect_signal('scanned', require('patch.utils').hide_scratchpad)
