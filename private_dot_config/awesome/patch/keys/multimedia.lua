local volume = require 'awesome-wm-widgets.volume-widget.volume'

---@type ActionBinding[]
local keys = {
  -- Toggle play/pause of media
  { key = 'XF86AudioPlay', action = 'playerctl play-pause', description = 'Toggle play/pause of media', group = 'media' },
  { key = 'XF86AudioPause', action = 'playerctl play-pause' },

  -- Skip tracks
  { key = 'XF86AudioNext', action = 'playerctl next', description = 'Skip to next track', group = 'media' },
  { key = 'XF86AudioPrev', action = 'playerctl previous', description = 'Skip to previous track', group = 'media' },

  -- Handle volume
  { key = 'XF86AudioRaiseVolume', action = 'pamixer -i 2', description = 'Volume Up', group = 'media' },
  { key = 'XF86AudioLowerVolume', action = 'pamixer -d 2', description = 'Volume Down', group = 'media' },
  { key = 'XF86AudioMute', action = 'pamixer -t', description = 'Toggle mute', group = 'media' },

  -- {
  --   key = 'F12',
  --   action = function()
  --     require('patch.utils').debug('This is a notification!', 'Test notification')
  --   end,
  -- },
}

return keys
