local null_ls = require 'null-ls'
-- local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local typescript_actions = require 'patch.code-actions.typescript'

local prettier_filetypes = {
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"less",
	"markdown",
	"scss",
	"typescript",
	"typescriptreact",
	"yaml",
}

local sources = {
	-- Code actions
	typescript_actions,

	-- Formatting
	formatting.prettier.with({ filetypes = prettier_filetypes, timeout = 5000 })
}

null_ls.setup({ 
	sources = sources, 
	on_init = function(new_client, _) 
		new_client.offset_encoding = 'utf-32' 
	end 
})
