local function include(package)
  return require('patch.plugins.ui.' .. package)
end

include 'buffer-management'
include 'diagnostics'
include 'dressing'
include 'filetree'
-- include 'notifications'
include 'scrollbar'
include 'statusline'
include 'telescope'
include 'noice'
