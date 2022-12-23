-- Standard awesome library
local awful = require 'awful'

local commands = {
  -- Exit if we've already started.
  'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi',

  -- Flag we've started, so it doesn't run again in this DE instance
  'xrdb -merge <<< "awesome.started:true"',

  -- Use dex to kick everything off.
  -- https://github.com/jceb/dex
  'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"',
}

-- Run the shell commands above, in sequence.
awful.spawn.with_shell(table.concat(commands, ';'))
