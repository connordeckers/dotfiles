local highlight = require 'nvim-custom-diagnostic-highlight'
local hlgrp = require 'patch.hl-groups'

highlight.setup {
  -- Wether to register the handler automatically
  register_handler = true,

  -- The name of the handler to be registered (has no effect if register_handler = false)
  handler_name = 'kasama/nvim-custom-diagnostic-highlight',

  -- The Highlight group to set at the diagnostic
  highlight_group = 'UnusedToken2',

  -- Lua patterns to be tested against the diagnostic message. Overrides default behavior
  patterns_override = {
    '%sunused',
    '^unused',
    'not used',
    'never used',
    'not read',
    'never read',
    'empty block',
  },

  -- Extra lua patterns to add. Does NOT override and will be added to the above
  extra_patterns = {},
  -- Name of the handler namespace that will contain the highlight (needs to be unique)
  diagnostic_handler_namespace = hlgrp,

  -- If set to a number, then highlighting is deferred until the cursor is N lines away from
  defer_until_n_lines_away = false,

  -- diagnostics. Useful to avoid unwanted highlights in the currently edited position.
  -- Events on which deferred highlights will be updated (passed to nvim_create_autocmd)
  defer_highlight_update_events = { 'CursorHold', 'CursorHoldI' },
}
