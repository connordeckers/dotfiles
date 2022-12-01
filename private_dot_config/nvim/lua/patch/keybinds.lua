local theme = require 'telescope.themes'
local patch_telescope = require 'patch.telescope'
local swap = require('swap-buffers').swap_buffers
local cpp_utils = require 'patch.language-features.c++'
local comment = require 'Comment.api'
local tmux = require 'tmux-navigator.controls'
local tb = require 'telescope.builtin'

local leader = ' '

local as_dropdown = theme.get_dropdown {}

vim.g.mapleader = leader
vim.g.maplocalleader = leader

local opts = { noremap = true, silent = true }

local normalmaps = {
  -- Toggle file tree
  ['<leader>n'] = require('nvim-tree').toggle,

  -- Save the file
  ['<leader>w'] = function()
    vim.api.nvim_command 'update'
  end,

  -- Toggle line numbers
  ['<leader>l'] = function()
    vim.opt.number = not (vim.opt.number:get())
  end,

  -- Replace the word under the cursor
  ['<Leader><Leader>'] = ':%s/\\<<C-r>=expand("<cword>")<CR>\\>//g<Left><Left>',

  -- Format the file
  ['<Leader>p'] = require('patch.utils.format').format_buffer,

  -- Quickly fold code
  ['<Leader>fa'] = 'za',

  -- Diagnostics
  ['<Leader>tr'] = require('trouble').toggle,

  -- Better hover definitions
  -- ['K'] = function()
  --   local ok, mod = pcall(require, 'hover')
  --   if not ok then
  --     return nil
  --   end
  --   mod.hover()
  -- end,
  -- ['gK'] = function()
  --   local ok, mod = pcall(require, 'hover')
  --   if not ok then
  --     return nil
  --   end
  --   mod.hover_select()
  -- end,

  -------------------
  -- Pane management
  -------------------

  ['<C-h>'] = tmux.navigate.left, -- Move left
  ['<C-j>'] = tmux.navigate.down, -- Move down
  ['<C-k>'] = tmux.navigate.up, -- Move up
  ['<C-l>'] = tmux.navigate.right, -- Move right

  -- Zoom in on a panel
  ['<C-w>z'] = '<C-w>_<C-w><bar>',

  ['<C-w><C-h>'] = function()
    swap 'h'
  end,
  ['<C-w><C-j>'] = function()
    swap 'j'
  end,
  ['<C-w><C-k>'] = function()
    swap 'k'
  end,
  ['<C-w><C-l>'] = function()
    swap 'l'
  end,

  -------------------
  -- Tab management
  -------------------

  -- New tab
  ['<C-t>'] = function()
    vim.api.nvim_command 'tabnew'
  end,

  -- Next tab
  ['<Tab>'] = function()
    vim.api.nvim_command 'BufferNext'
  end,

  -- Previous tab
  ['<S-Tab>'] = function()
    vim.api.nvim_command 'BufferPrevious'
  end,

  ['<Leader>q'] = function()
    vim.api.nvim_command 'BufferClose'
  end,

  ['<C-p>'] = function()
    vim.api.nvim_command 'BufferPick'
  end,

  -----------------------
  -- Telescope mappings
  -----------------------

  -- Show all telescope builtins
  ['<leader>t'] = tb.builtin,

  -- Show file finder
  ['<leader>tf'] = tb.find_files,
  ['<leader>th'] = function()
    tb.find_files { hidden = true }
  end,

  -- Show grep finder
  ['<leader>tg'] = tb.live_grep,

  -- Show document symbols
  ['<leader>ts'] = tb.symbols,

  -- Show diagnostics
  ['<leader>td'] = function()
    tb.diagnostics(as_dropdown)
  end,

  -- Show config files
  ['<leader>tp'] = function()
    patch_telescope.project_files(as_dropdown)
  end,

  -- Show config files
  ['<leader>ta'] = function()
    patch_telescope.angular(as_dropdown)
  end,

  -----------------------
  -- Winshift mappings
  -----------------------

  -- Show all telescope builtins
  ['<leader>sw'] = require('winshift').cmd_winshift,
  ['<leader>ss'] = function()
    require('winshift').cmd_winshift 'swap'
  end,

  -------------------------------
  -- Language-specific bindings
  -------------------------------

  -- Build current file, and run if successful
  ['<leader>rr'] = cpp_utils.build_and_run,

  -- Build current file, but don't run it
  ['<leader>rb'] = cpp_utils.compile,

  -- Run last compiled file
  ['<leader>rc'] = cpp_utils.run,
}

local normal_visual = {
  -----------------------
  -- Comment mappings
  -----------------------

  -- -- Toggle linewise-comment on the current line
  -- ['<leader>ci'] = comment.toggle.linewise.current,

  -- -- Toggle blockwise-comment on the current line
  -- ['<leader>cb'] = comment.toggle.blockwise.current,

  -- -- Just straight comment/uncomment; no toggle here
  -- ['<leader>cc'] = comment.comment.linewise.current,
  -- ['<leader>cu'] = comment.uncomment.linewise.current,

  -- ['<leader>cC'] = comment.comment.blockwise.current,
  -- ['<leader>cU'] = comment.uncomment.blockwise.current,
}

-- api.toggle.linewise(motion, config?)
-- api.toggle.linewise.current(motion?, config?)
-- api.toggle.linewise.count(count, config?)

-- api.toggle.blockwise(motion, config?)
-- api.toggle.blockwise.current(motion?, config?)
-- api.toggle.blockwise.count(count, config?)

-- Toggle current line (linewise) using C-/
vim.keymap.set('n', '<leader>ci', comment.toggle.linewise.current)

-- Toggle current line (blockwise) using C-\
vim.keymap.set('n', '<leader>cb', comment.toggle.blockwise.current)

-- Toggle lines (linewise) with dot-repeat support
-- Example: <leader>gc3j will comment 4 lines
vim.keymap.set('n', '<leader>gc', comment.call('toggle.linewise', 'g@'), { expr = true })

-- Toggle lines (blockwise) with dot-repeat support
-- Example: <leader>gb3j will comment 4 lines
vim.keymap.set('n', '<leader>gb', comment.call('toggle.blockwise', 'g@'), { expr = true })

local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

-- Toggle selection (linewise)
vim.keymap.set('x', '<leader>ci', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  comment.toggle.linewise(vim.fn.visualmode())
end)

-- Toggle selection (blockwise)
vim.keymap.set('x', '<leader>cb', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  comment.toggle.blockwise(vim.fn.visualmode())
end)

local M = {}
local function yank_comment_paste() end
local function insert_jsdoc_comment()
  if vim.bo.filetype == 'typescript' then
    comment.comment.blockwise.current {
      move_cursor_to = 'between',
      pre_hook = function()
        return '/** %s */'
      end,
    }
  else
    comment.comment.linewise.current()
  end
end

function M.reload_keybinds()
  for map, action in pairs(normalmaps) do
    vim.keymap.set('n', map, action, opts)
  end

  for map, action in pairs(normal_visual) do
    vim.keymap.set({ 'n', 'v' }, map, action, opts)
  end

  -- Shift-H and Shift-L jump to beginning and end of line, respectively
  vim.keymap.set({ 'n', 'v' }, 'H', '^', { silent = true, remap = true })
  vim.keymap.set({ 'n', 'v' }, 'L', '$', { silent = true, remap = true })

  -- Begin inserting content from a system call at cursor
  vim.keymap.set({ 'i' }, '<C-e>', "<C-R>=trim(system(''))<left><left><left>")

  -- Insert blank comment in Insert mode
  vim.keymap.set({ 'i' }, '<C-c>', insert_jsdoc_comment, { silent = true })
  vim.keymap.set({ 'x' }, '<Leader>p', function()
    vim.lsp.buf.range_formatting {}
  end, { silent = true, buffer = true })

  vim.keymap.set({ 'v' }, '<Leader>yp', yank_comment_paste, { silent = true })
end

M.reload_keybinds()

return M
