local severity = vim.diagnostic.severity

require('patch.utils').safe_setup('nvim-tree', {
  -- Will automatically open the tree when running setup if startup buffer is
  -- a directory, is empty or is unnamed. nvim-tree window will be focused.
  open_on_setup = true,

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
    severity = { min = severity.WARN, max = severity.ERROR },
  },

  -- Use `vim.ui.select` style prompts. Necessary when using a UI prompt decorator
  -- such as dressing.nvim or telescope-ui-select.nvim
  select_prompts = true,

  -- Window / buffer setup.
  view = {
    -- Resize the window on each draw based on the longest line.
    adaptive_size = true,

    -- Configuration options for floating windows
    float = { enable = false },
  },

  -- UI rendering setup
  renderer = {
    -- Appends a trailing slash to folder names.
    add_trailing = true,

    -- Compact folders that only contain a single folder into one node in the file tree.
    group_empty = true,

    -- Highlight icons and/or names for opened files.
    highlight_opened_files = 'all',

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
})
