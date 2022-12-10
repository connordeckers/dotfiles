local packer = require 'packer'
local use = packer.use

-- A prettier diff-view
use {
  'sindrets/diffview.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
}

use 'tpope/vim-fugitive'

use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signcolumn = false,
      numhl = true,
      linehl = false,
      word_diff = false,
      keymaps = {},
      watch_gitdir = { interval = 1000, follow_files = true },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = { virt_text = true, virt_text_pos = 'eol', delay = 1000 },
      current_line_blame_formatter_opts = { relative_time = false },
      sign_priority = 6,
      update_debounce = 150,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    }
  end,
}
