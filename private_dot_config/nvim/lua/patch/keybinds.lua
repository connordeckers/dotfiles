local theme = require 'telescope.themes'
local patch_telescope = require 'patch.telescope'
local swap = require 'swap-buffers'.swap_buffers
local cpp_utils = require 'patch.language-features.c++'

local comment = require 'Comment.api'
local commentcfg = {
	pre_hook = function(ctx)
		-- Only calculate commentstring for ts filetypes
		--[[ if vim.bo.filetype == 'typescript' then ]]
		--[[ 	local utils = require 'ts_context_commentstring.utils' ]]
		--[[ 	local inter = require 'ts_context_commentstring.internal' ]]
		--[[ 	local comment_utils = require 'Comment.utils' ]]


		--[[ 	-- Determine whether to use linewise or blockwise commentstring ]]
		--[[ 	local type = ctx.ctype == comment_utils.ctype.line and '__default' or '__multiline' ]]

		--[[ 	-- Determine the location where to calculate commentstring from ]]
		--[[ 	local location = nil ]]
		--[[ 	if ctx.ctype == comment_utils.ctype.block then ]]
		--[[ 		location = utils.get_cursor_location() ]]
		--[[ 	elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then ]]
		--[[ 		location = utils.get_visual_start_location() ]]
		--[[ 	end ]]

		--[[ 	return inter.calculate_commentstring({ key = type, location = location }) ]]
		--[[ end ]]
	end
}

local tb = require 'telescope.builtin'
local leader = ' '

vim.g.mapleader = leader
vim.g.maplocalleader = leader

local opts = { noremap = true, silent = true }

local normalmaps = {
	-- Toggle file tree
	["<leader>n"] = require "nvim-tree".toggle,

	-- Save the file
	["<leader>w"] = function()
		vim.api.nvim_command("write")
	end,

	-- Toggle line numbers
	["<leader>l"] = function()
		vim.opt.number = not (vim.opt.number:get())
	end,

	-- Replace the word under the cursor
	["<Leader><Leader>"] = ':%s/\\<<C-r>=expand("<cword>")<CR>\\>//g<Left><Left>',

	-- Format the file
	["<Leader>p"] = require 'patch.utils.format'.format_buffer,

	-- Quickly fold code
	["<Leader>fa"] = "za",

	-------------------
	-- Pane management
	-------------------

	["<C-h>"] = "<C-w>h", -- Move left
	["<C-j>"] = "<C-w>j", -- Move down
	["<C-k>"] = "<C-w>k", -- Move up
	["<C-l>"] = "<C-w>l", -- Move right

	-- Zoom in on a panel
	["<C-w>z"] = "<C-w>_<C-w><bar>",

	['<C-w><C-h>'] = function() swap('h') end,
	['<C-w><C-j>'] = function() swap('j') end,
	['<C-w><C-k>'] = function() swap('k') end,
	['<C-w><C-l>'] = function() swap('l') end,

	-------------------
	-- Tab management
	-------------------

	-- New tab
	["<C-t>"] = function()
		vim.api.nvim_command("tabnew")
	end,

	-- Next tab
	["<Tab>"] = function()
		vim.api.nvim_command("BufferNext")
	end,

	-- Previous tab
	["<S-Tab>"] = function()
		vim.api.nvim_command("BufferPrevious")
	end,

	["<Leader>q"] = function()
		vim.api.nvim_command("BufferClose")
	end,

	["<C-p>"] = function()
		vim.api.nvim_command("BufferPick")
	end,


	-----------------------
	-- Comment mappings
	-----------------------

	-- Insert linewise comments above or below
	["<leader>ck"] = function() comment.insert.linewise.above(commentcfg) end,
	["<leader>cj"] = function() comment.insert.linewise.below(commentcfg) end,

	-- Insert linewise comments above or below
	["<leader>cK"] = function() comment.insert.blockwise.above(commentcfg) end,
	["<leader>cJ"] = function() comment.insert.blockwise.below(commentcfg) end,

	-- Insert EOL linewise comment
	["<leader>ca"] = function() comment.insert.linewise.eol(commentcfg) end,

	-----------------------
	-- Telescope mappings
	-----------------------

	-- Show all telescope builtins
	["<leader>t"] = tb.builtin,

	-- Show file finder
	["<leader>tf"] = tb.find_files,
	["<leader>th"] = function() tb.find_files({ hidden = true }) end,

	-- Show grep finder
	["<leader>tg"] = tb.live_grep,

	-- Show document symbols
	["<leader>ts"] = tb.symbols,

	-- Show yank register history
	["<leader>tr"] = function() require "telescope".extensions.neoclip.default() end,

	-- Show diagnostics
	["<leader>td"] = tb.diagnostics,

	-- Show config files
	["<leader>tp"] = patch_telescope.project_files,

	-- Show config files
	["<leader>ta"] = function() patch_telescope.angular(theme.get_dropdown({})) end,


	-----------------------
	-- Winshift mappings
	-----------------------

	-- Show all telescope builtins
	["<leader>sw"] = require 'winshift'.cmd_winshift,
	["<leader>ss"] = function() require 'winshift'.cmd_winshift('swap') end,


	-------------------------------
	-- Language-specific bindings
	-------------------------------

	-- Build current file, and run if successful
	["<leader>rr"] = cpp_utils.build_and_run,

	-- Build current file, but don't run it
	["<leader>rb"] = cpp_utils.compile,

	-- Run last compiled file
	["<leader>rc"] = cpp_utils.run,
}


local normal_visual = {
	-----------------------
	-- Comment mappings
	-----------------------

	-- Toggle linewise-comment on the current line
	["<leader>ci"] = function() comment.toggle.linewise.current(commentcfg) end,

	-- Toggle blockwise-comment on the current line
	["<leader>cs"] = function() comment.toggle.blockwise.current(commentcfg) end,

	-- Just straight comment/uncomment; no toggle here
	["<leader>cc"] = function() comment.comment.linewise.current(commentcfg) end,
	["<leader>cu"] = function() comment.uncomment.linewise.current(commentcfg) end,

	["<leader>cC"] = function() comment.comment.blockwise.current(commentcfg) end,
	["<leader>cU"] = function() comment.uncomment.blockwise.current(commentcfg) end,

}

local M = {}

local function yank_comment_paste()

end

local function insert_jsdoc_comment()
	if vim.bo.filetype == 'typescript' then
		comment.comment.blockwise.current({
			sticky = true,
			move_cursor_to = "between",
			pre_hook = function()
				return "/** %s */"
			end,
		})
	else
		comment.comment.linewise.current()
	end
end

function M.reload_keybinds()
	for map, action in pairs(normalmaps) do
		vim.keymap.set("n", map, action, opts)
	end

	for map, action in pairs(normal_visual) do
		vim.keymap.set({ "n", "v" }, map, action, opts)
	end

	-- Shift-H and Shift-L jump to beginning and end of line, respectively
	vim.keymap.set({ "n", "v" }, "H", "^", { silent = true, remap = true })
	vim.keymap.set({ "n", "v" }, "L", "$", { silent = true, remap = true })

	-- Begin inserting content from a system call at cursor
	vim.keymap.set({ "i" }, "<C-e>", "<C-R>=trim(system(''))<left><left><left>")

	-- Insert blank comment in Insert mode
	vim.keymap.set({ 'i' }, "<C-c>", insert_jsdoc_comment, { silent = true })
	vim.keymap.set({ "x" }, "<Leader>p", function() vim.lsp.buf.range_formatting({}) end, { silent = true, buffer = true })

	vim.keymap.set({ "v" }, "<Leader>yp", yank_comment_paste, { silent = true })
end

M.reload_keybinds()

return M
