vim.cmd [[
	highlight LspDiagnosticsUnusedHint cterm=strikethrough gui=strikethrough ctermfg=14 guifg=#545862
]]

local theme = require 'onedark'
theme.setup {
  style = 'dark',
  transparent = false,
  code_style = {
    comments = 'italic',
    keywords = 'italic',
    functions = 'none',
    strings = 'none',
    variables = 'none',
  },
}
theme.load()
