local beautiful = require 'beautiful'
-- local dpi = require('beautiful.xresources').apply_dpi

local props = {}

-- This is used later as the default terminal and editor to run.
props.terminal = 'kitty'
props.editor = os.getenv 'EDITOR' or 'vim'
props.editor_cmd = props.terminal .. ' -e ' .. props.editor

-- Our drop in launcher.
-- TODO
-- 		Lets eventually work around the issues and build our own
-- 		with awful.prompt and Lua. Be good to keep it in the ecosystem,
-- 		plus allow all the customisation we want.
props.launcher = 'j4-dmenu-desktop'

-- Usually, Mod4 is the key with a logo between Control and Alt.
props.modkey = 'Mod4'

props.theme = beautiful.get()

props.screenshot = 'flameshot gui'

return props
