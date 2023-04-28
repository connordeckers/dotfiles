local function swap_buffer(direction)
  return function()
    require('swap-buffers').swap_buffers(direction)
  end
end

local function telescope(method, opts)
  return function()
    require('telescope.builtin')[method](opts)
  end
end

local function navigate(method)
  return function()
    require('tmux-navigator.controls').navigate[method]()
  end
end

return {
  -- Swap buffers with each other
  {
    'caenrique/swap-buffers.nvim',
    keys = {
      { '<C-w><C-h>', swap_buffer 'h' },
      { '<C-w><C-j>', swap_buffer 'j' },
      { '<C-w><C-k>', swap_buffer 'k' },
      { '<C-w><C-l>', swap_buffer 'l' },
    },
  },

  -- Allows the windows to be shifted with ease.
  {
    'sindrets/winshift.nvim',
    keys = {
      {
        '<leader>sw',
        function()
          require('winshift').cmd_winshift()
        end,
      },
      {
        '<leader>ss',
        function()
          require('winshift').cmd_winshift 'swap'
        end,
      },
    },
  },

  -- Diagnostics that are pretty
  {
    'folke/trouble.nvim',
    keys = {
      {
        '<leader>tr',
        function()
          require('trouble').toggle()
        end,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {
      position = 'right', -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = 'document_diagnostics', -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      fold_open = '', -- icon used for open folds
      fold_closed = '', -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      indent_lines = true, -- add an indent guide below the fold icons
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
    },
  },

  -- Nvim tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'antosha417/nvim-lsp-file-operations',
      'echasnovski/mini.base16',
    },

    keys = {
      {
        '<leader>n',
        function()
          require('nvim-tree.api').tree.toggle()
        end,
      },
    },

    cmd = {
      'NvimTreeOpen',
      'NvimTreeClose',
      'NvimTreeToggle',
      'NvimTreeFocus',
      'NvimTreeRefresh',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeClipboard',
      'NvimTreeResize',
      'NvimTreeCollapse',
      'NvimTreeCollapseKeepBuffers',
    },

    config = {
      -- Changes how files within the same directory are sorted.
      -- Can be one of `name`, `case_sensitive`, `modification_time`, `extension` or a
      -- function.
      sort_by = 'extension',

      -- Keeps the cursor on the first letter of the filename when moving in the tree.
      hijack_cursor = true,

      -- Changes the tree root directory on `DirChanged` and refreshes the tree.
      sync_root_with_cwd = true,

      -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
      respect_buf_cwd = true,

      -- Hijacks new directory buffers when they are opened (`:e dir`).
      hijack_directories = { enable = true },

      -- Update the focused file on `BufEnter`, un-collapses the folders recursively
      -- until it finds the file.
      update_focused_file = {
        enable = true,

        -- Update the root directory of the tree if the file is not under current root directory.
        -- It prefers vim's cwd and `root_dirs`. Otherwise it falls back to the folder containing the file.
        -- Only relevant when `update_focused_file.enable` is `true`
        update_root = true,
      },

      -- Show LSP and COC diagnostics in the signcolumn
      diagnostics = {
        enable = true,

        -- Show diagnostic icons on parent directories.
        show_on_dirs = true,

        -- Severity for which the diagnostics will be displayed.
        severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.ERROR },
      },

      -- Use `vim.ui.select` style prompts. Necessary when using a UI prompt decorator
      -- such as dressing.nvim or telescope-ui-select.nvim
      select_prompts = true,

      -- Hide dotfiles by default.
      filters = {
        dotfiles = true,
      },

      -- Window / buffer setup.
      view = {
        -- Resize the window on each draw based on the longest line.
        adaptive_size = true,

        -- Configuration options for floating windows
        float = { enable = false },

        mappings = {
          list = {
            -- Enter a directory/edit a file by navigating right
            { key = 'l', action = 'edit' },

            -- Collapse a directory by navigating left
            { key = 'h', action = 'close_node' },

            -- Enter a directory
            { key = 'L', action = 'cd' },
          },
        },
      },

      -- UI rendering setup
      renderer = {
        -- Appends a trailing slash to folder names.
        add_trailing = true,

        -- Compact folders that only contain a single folder into one node in the file tree.
        group_empty = true,

        -- Highlight icons and/or names for opened files.
        -- highlight_opened_files = 'all',

        -- Configuration options for tree indent markers.
        indent_markers = { enable = true },
      },

      -- Configuration for tab behaviour.
      tab = {
        -- Configuration for syncing nvim-tree across tabs.
        sync = {
          -- Opens the tree automatically when switching tabpage or opening a new
          -- tabpage if the tree was previously open.
          open = true,

          -- Closes the tree across all tabpages when the tree is closed.
          close = true,
        },
      },

      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings. Feel free to modify or remove as you wish.
        --
        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts 'CD')
        vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts 'Open: In Place')
        vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts 'Info')
        vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts 'Rename: Omit Filename')
        vim.keymap.set('n', '<C-t>', api.node.open.tab, opts 'Open: New Tab')
        vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts 'Open: Vertical Split')
        vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts 'Open: Horizontal Split')
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<Tab>', api.node.open.preview, opts 'Open Preview')
        vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts 'Next Sibling')
        vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts 'Previous Sibling')
        vim.keymap.set('n', '.', api.node.run.cmd, opts 'Run Command')
        vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts 'Up')
        vim.keymap.set('n', 'a', api.fs.create, opts 'Create')
        vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts 'Move Bookmarked')
        vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts 'Toggle No Buffer')
        vim.keymap.set('n', 'c', api.fs.copy.node, opts 'Copy')
        vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts 'Toggle Git Clean')
        vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts 'Prev Git')
        vim.keymap.set('n', ']c', api.node.navigate.git.next, opts 'Next Git')
        vim.keymap.set('n', 'd', api.fs.remove, opts 'Delete')
        vim.keymap.set('n', 'D', api.fs.trash, opts 'Trash')
        vim.keymap.set('n', 'E', api.tree.expand_all, opts 'Expand All')
        vim.keymap.set('n', 'e', api.fs.rename_basename, opts 'Rename: Basename')
        vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts 'Next Diagnostic')
        vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts 'Prev Diagnostic')
        vim.keymap.set('n', 'F', api.live_filter.clear, opts 'Clean Filter')
        vim.keymap.set('n', 'f', api.live_filter.start, opts 'Filter')
        vim.keymap.set('n', 'g?', api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts 'Copy Absolute Path')
        vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts 'Toggle Dotfiles')
        vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts 'Toggle Git Ignore')
        vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts 'Last Sibling')
        vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts 'First Sibling')
        vim.keymap.set('n', 'm', api.marks.toggle, opts 'Toggle Bookmark')
        vim.keymap.set('n', 'o', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts 'Open: No Window Picker')
        vim.keymap.set('n', 'p', api.fs.paste, opts 'Paste')
        vim.keymap.set('n', 'P', api.node.navigate.parent, opts 'Parent Directory')
        vim.keymap.set('n', 'q', api.tree.close, opts 'Close')
        vim.keymap.set('n', 'r', api.fs.rename, opts 'Rename')
        vim.keymap.set('n', 'R', api.tree.reload, opts 'Refresh')
        vim.keymap.set('n', 's', api.node.run.system, opts 'Run System')
        vim.keymap.set('n', 'S', api.tree.search_node, opts 'Search')
        vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts 'Toggle Hidden')
        vim.keymap.set('n', 'W', api.tree.collapse_all, opts 'Collapse')
        vim.keymap.set('n', 'x', api.fs.cut, opts 'Cut')
        vim.keymap.set('n', 'y', api.fs.copy.filename, opts 'Copy Name')
        vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts 'Copy Relative Path')
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts 'CD')
        -- END_DEFAULT_ON_ATTACH

        -- Mappings migrated from view.mappings.list
        --
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', 'L', api.tree.change_root_to_node, opts 'CD')
      end,
    },
  },

  ---------------
  -- Telescope --
  ---------------
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-symbols.nvim',
      'BurntSushi/ripgrep',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      -- Show all telescope builtins
      { '<leader>tb', telescope 'builtin' },

      -- Show file finder
      { '<leader>tf', telescope 'find_files' },
      { '<leader>th', telescope('find_files', { hidden = true }) },

      -- Show grep finder
      { '<leader>tg', telescope 'live_grep' },

      -- Show document symbols
      { '<leader>ts', telescope 'symbols' },

      -- Show diagnostics
      { '<leader>td', telescope 'diagnostics' },

      -- Show notifications
      -- { '<leader>tn', function() require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown {}) end, },

      -- Grep current string under cursor within workspace
      { '<leader>ff', telescope 'grep_string' },

      -- Show jumplist
      { '<leader>tj', telescope 'jumplist' },

      -- List registers
      { '"', telescope 'registers' },

      -- List open buffers
      { '<C-p>', telescope 'buffers' },
    },

    config = {
      defaults = { mappings = { i = { ['<C-h>'] = 'which_key' } } },
      pickers = {
        find_files = { find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' } },
        diagnostics = { theme = 'dropdown' },
        jumplist = { theme = 'dropdown' },
        registers = { theme = 'dropdown' },
        buffers = { theme = 'dropdown' },
      },
      extensions = {},
    },
  },

  -- Tmux pane navigation assistant
  {
    'connordeckers/tmux-navigator.nvim',

    keys = {
      { '<C-h>', navigate 'left', desc = 'Move to the panel on the left' }, -- Move left
      { '<C-j>', navigate 'down', desc = 'Move to the panel below' }, -- Move down
      { '<C-k>', navigate 'up', desc = 'Move to the panel above' }, -- Move up
      { '<C-l>', navigate 'right', desc = 'Move to the panel on the right' }, -- Move right
    },

    config = {
      enabled = true,
      DisableMapping = true,
      DisableWhenZoomed = true,
    },
  },

  -- Rooter changes the working directory to the project root when you open a file or directory.
  'airblade/vim-rooter',

  -- Some nice git features
  {
    'lewis6991/gitsigns.nvim',
    config = {
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
    },
  },

  -- {
  --   'sindrets/diffview.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --   },
  -- },

  -- Surround text with other text. Neat!
  {
    'kylechui/nvim-surround',
    event = 'BufRead',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = {},
  },

  -- Lightspeed navigation, but better!
  -- {
  --   'ggandor/leap.nvim',
  --   event = 'BufRead',
  --   dependencies = { 'tpope/vim-repeat' },
  --   config = function()
  --     require('leap').add_default_mappings()
  --   end,
  -- },

  -- Better, easier, structural renaming.
  {
    'cshuaimin/ssr.nvim',
    keys = {
      {
        '<leader>sr',
        mode = { 'n', 'x' },
        function()
          require('ssr').open()
        end,
      },
    },
    config = {
      min_width = 50,
      min_height = 5,
      keymaps = {
        close = 'q',
        next_match = 'n',
        prev_match = 'N',
        replace_all = '<leader><cr>',
      },
    },
  },

  -- Commenting tool
  {
    'numtostr/comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    keys = {
      -- Toggle current line (linewise) using C-i
      {
        '<leader>ci',
        function()
          require('Comment.api').toggle.linewise.current()
        end,
      },
      {
        '<leader>ci',
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
          require('Comment.api').toggle.linewise(vim.fn.visualmode())
        end,
        mode = 'x',
      },

      -- Toggle current line (blockwise) using C-b
      {
        '<leader>cb',
        function()
          require('Comment.api').toggle.blockwise.current()
        end,
      },

      {
        '<leader>cb',
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
          require('Comment.api').toggle.blockwise(vim.fn.visualmode())
        end,
        mode = 'x',
      },

      -- Toggle lines (linewise) with dot-repeat support
      -- Example: <leader>gc3j will comment 4 lines
      {
        '<leader>gc',
        function()
          require('Comment.api').call('toggle.linewise', 'g@')
        end,
        expr = true,
      },

      -- Toggle lines (blockwise) with dot-repeat support
      -- Example: <leader>gb3j will comment 4 lines
      {
        '<leader>gb',
        function()
          require('Comment.api').call('toggle.blockwise', 'g@')
        end,
        expr = true,
      },
    },
    config = {
      ---Add a space b/w comment and the line
      ---@type boolean|fun():boolean
      padding = true,

      ---Whether the cursor should stay at its position
      ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
      ---@type boolean
      sticky = true,

      ---Lines to be ignored while comment/uncomment.
      ---Could be a regex string or a function that returns a regex string.
      ---Example: Use '^$' to ignore empty lines
      ---@type string|fun():string
      ignore = nil,
      -- ignore = '^$',

      ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      ---NOTE: If `mappings = false` then the plugin won't create any mappings
      ---@type boolean|table
      mappings = {
        basic = false,
        extra = false,
      },

      ---Pre-hook, called before commenting the line
      ---@type fun(ctx:CommentCtx):any|nil
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

      ---Post-hook, called after commenting is done
      ---@type fun(ctx: CommentCtx)
      post_hook = nil,
    },
  },

  -- Continuously updated session files
  { 'tpope/vim-obsession', cmd = 'Obsess' },

  {
    'mbbill/undotree',
    cmd = { 'UndotreeToggle' },
    keys = { { '<leader>u', '<cmd>UndotreeToggle<cr>' } },
  },
}
