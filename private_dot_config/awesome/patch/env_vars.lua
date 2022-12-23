local vars = {
  -- The config directory of the current user, as standardised by `XDG_CONFIG_HOME`
  -- 		Defaults to `$HOME/.config`
  config_dir = os.getenv 'XDG_CONFIG_HOME' or string.format('%s/.config', os.getenv 'HOME'),
}

return vars
