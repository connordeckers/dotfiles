local hlgroup = vim.api.nvim_create_namespace 'patch/hl'
local augroup = vim.api.nvim_create_augroup('patch/hl_augrp', {})

local function define_additional_tokens()
  -- Create an "unused" highlight style
  vim.cmd [[ hi! UnusedToken cterm=italic,bold,strikethrough gui=italic,bold,strikethrough guifg=#5c6370 ]]

  -- Fix the floating dialog quirks
  vim.cmd [[
		hi! link FloatBorder Float
		hi! link NormalFloat Normal
	]]
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  callback = define_additional_tokens,
})

vim.api.nvim_set_hl_ns(hlgroup)

return hlgroup
