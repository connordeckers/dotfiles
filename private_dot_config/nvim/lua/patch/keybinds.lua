local tb = require 'telescope.builtin'
local theme = require 'telescope.themes'
local patch_telescope = require 'patch.telescope'
local cpp_utils = require 'patch.language-features.c++'
local comment = require 'Comment.api'
local tmux = require 'tmux-navigator.controls'
local tscomment = require 'patch.utils.treesitter-commenting'

local leader = ' '

local as_dropdown = theme.get_dropdown {}

vim.g.mapleader = leader
vim.g.maplocalleader = leader

local opts = { noremap = true, silent = true }

local normalmaps = {
  -- Toggle file tree
  ['<leader>n'] = function()
    require('nvim-tree').toggle()
  end,

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
  ['<Leader>tr'] = function()
    require('trouble').toggle()
  end,

  ['<leader>df'] = function()
    tscomment.insert.before.fn ''
  end,

  ['<leader>cd'] = function()
    local my_name = vim.fn.system('git config user.name'):gsub('%s+', '')
    local date = os.date '%Y%m%d'

    tscomment.insert.before.fn(string.format('TODO @%s %s - ', my_name, date))
  end,

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
    require('swap-buffers').swap_buffers 'h'
  end,
  ['<C-w><C-j>'] = function()
    require('swap-buffers').swap_buffers 'j'
  end,
  ['<C-w><C-k>'] = function()
    require('swap-buffers').swap_buffers 'k'
  end,
  ['<C-w><C-l>'] = function()
    require('swap-buffers').swap_buffers 'l'
  end,

  -------------------
  -- Tab management
  -------------------

  -- New tab
  ['<C-t>'] = function()
    vim.api.nvim_command 'tabnew'
  end,

  -- Next tab
  ['<Tab>'] = ':bnext<CR>',

  -- Previous tab
  ['<S-Tab>'] = ':bprevious<CR>',

  ['<Leader>q'] = ':bdelete<CR>',

  -----------------------
  -- Telescope mapipings
  -----------------------

  -- Show all telescope builtins
  ['<leader>tb'] = function()
    return tb.builtin()
  end,

  -- Show file finder
  ['<leader>tf'] = function()
    tb.find_files()
  end,
  ['<leader>th'] = function()
    tb.find_files { hidden = true }
  end,

  -- Show grep finder
  ['<leader>tg'] = function()
    tb.live_grep()
  end,

  -- Show document symbols
  ['<leader>ts'] = function()
    tb.symbols()
  end,

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

  ['<leader>tn'] = function()
    require('telescope').extensions.notify.notify(as_dropdown)
  end,

  -- Grep current string under cursor within workspace
  ['<leader>ff'] = function()
    tb.grep_string()
  end,

  -- List registers
  ['"'] = function()
    tb.registers(as_dropdown)
  end,

  -- List open buffers
  ['<C-p>'] = function()
    tb.buffers(as_dropdown)
  end,

  -----------------------
  -- Winshift mappings
  -----------------------

  -- Show all telescope builtins
  ['<leader>sw'] = function()
    require('winshift').cmd_winshift()
  end,
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

vim.keymap.set('', '<C-Up>', '<C-y>', { noremap = true })
vim.keymap.set('', '<C-Down>', '<C-e>', { noremap = true })

vim.keymap.set('i', '<C-Up>', '<C-O><C-y>', { noremap = true })
vim.keymap.set('i', '<C-Down>', '<C-O><C-e>', { noremap = true })

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

  vim.keymap.set({ 'i' }, '<C-e>', function()
    -- Ask for prompt value, run as system call
    local utils = require 'patch.utils.string-utils'
    local insertCursorAfter = true

    local bufnr = vim.api.nvim_get_current_buf()
    local pos = vim.api.nvim_win_get_cursor(0)

    local row = pos[1] - 1
    local col = pos[2]

    vim.ui.input({ prompt = 'System command: ', completion = 'shellcmd' }, function(result)
      if result == nil then
        return
      end

      local lines = utils.split(vim.fn.trim(vim.fn.system(result)), '\n')
      vim.api.nvim_buf_set_text(bufnr, row, col, row, col, lines)

      if insertCursorAfter then
        vim.api.nvim_win_set_cursor(0, { row + #lines, col + string.len(lines[#lines]) })
      else
        vim.api.nvim_win_set_cursor(0, { row + 1, col })
      end
    end)
  end)

  -- Insert blank comment in Insert mode
  vim.keymap.set({ 'i' }, '<C-c>', insert_jsdoc_comment, { silent = true })
  vim.keymap.set({ 'x' }, '<Leader>p', function()
    vim.lsp.buf.range_formatting {}
  end, { silent = true, buffer = true })

  vim.keymap.set({ 'v' }, '<Leader>yp', yank_comment_paste, { silent = true })
end

M.reload_keybinds()

return M
