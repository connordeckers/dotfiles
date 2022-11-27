local ok, packer = pcall(require, 'packer')
if not ok then
  error 'Packer not installed or configured. Please try again.'
end

local function defer(path)
  require(path)
end

packer.startup(function(use)
  local function add(conf)
    use { conf[1], config = defer(conf[2]) }
  end

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lightspeed navigation!
  add { 'ggandor/lightspeed.nvim', 'patch.config.lightspeed' }

  -- Adds a dashboard to neovim.
  use 'mhinz/vim-startify'

  -- Adds a nicer scrollbar
  add { 'petertriho/nvim-scrollbar', 'patch.config.scrollbar' }

  -- TODO: Is this still needed?
  use 'Kasama/nvim-custom-diagnostic-highlight'

  -- Better syntax highlighting for kitty.conf files.
  use 'fladson/vim-kitty'

  -- Allows the windows to be shifted with ease.
  add { 'sindrets/winshift.nvim', 'patch.config.winshift' }

  -- A prettier diff-view
  use 'sindrets/diffview.nvim'

  -- Sync navigation with tmux
  use {
    'connordeckers/tmux-navigator.nvim',
    config = function()
      require 'patch.config.tmux-navigator'
    end,
  }

  -- Surround text with other text. Neat!
  add { 'kylechui/nvim-surround', 'patch.config.surround' }

  -- TODO: What's this do again?
  use 'caenrique/swap-buffers.nvim'

  -- Better, easier, structural renaming.
  use 'cshuaimin/ssr.nvim'

  ---------------------------
  --     Requirements
  ---------------------------

  use 'nvim-lua/plenary.nvim'

  ---------------------------
  --       Telescope
  ---------------------------

  -- Telescope and its peripheries
  use {
    'nvim-telescope/telescope.nvim',
    config = defer 'patch.config.telescope',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-symbols.nvim',
      'benfowler/telescope-luasnip.nvim',
    },
  }

  -- Make things PRETTY
  add { 'stevearc/dressing.nvim', 'patch.config.dressing' }

  ---------------------------
  --      Tree Sitter
  ---------------------------

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = defer 'patch.config.treesitter',
    requires = {
      'windwp/nvim-ts-autotag',

      -- Auto pair braces
      { 'windwp/nvim-autopairs', config = defer 'patch.config.autopairs' },

      'ThePrimeagen/refactoring.nvim',

      -- Some additional treesitter functionality
      'nvim-treesitter/nvim-treesitter-textobjects',
      'theHamsta/nvim-treesitter-pairs',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground',
      'nvim-treesitter/tree-sitter-lua',
    },
  }

  use 'williamboman/mason-lspconfig.nvim'
  add { 'williamboman/mason.nvim', 'patch.config.mason' }
  add { 'neovim/nvim-lspconfig', 'patch.config.lsp' }

  use 'jose-elias-alvarez/typescript.nvim'
  add { 'ray-x/lsp_signature.nvim', 'patch.config.lspsig' }

  -- Debug Adaptor Protocol
  use 'mfussenegger/nvim-dap'

  -- Diagnostics that are pretty
  add { 'folke/trouble.nvim', 'patch.config.trouble' }

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    config = defer 'patch.config.cmp',
    requires = {
      -- LSP source for nvim-cmp
      'hrsh7th/cmp-nvim-lsp',

      -- Use completions from the buffer
      'hrsh7th/cmp-buffer',

      -- Use completions from the path
      'hrsh7th/cmp-path',

      -- Add completions to the cmdline
      'hrsh7th/cmp-cmdline',

      -- Snippet engines
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    requires = { 'honza/vim-snippets' },
    config = defer 'patch.config.snippets',
  }

  -- Add better lsp support
  add { 'jose-elias-alvarez/null-ls.nvim', 'patch.config.null-ls' }

  ---------------------------
  --    Task management
  ---------------------------

  add { 'Shatur/neovim-tasks', 'patch.config.tasks' }

  use {
    'BenGH28/neo-runner.nvim',
    run = ':UpdateRemotePlugins',
  }

  ---------------------------
  --          Misc
  ---------------------------

  -- Commenting tool
  add { 'numtostr/comment.nvim', 'patch.config.comments' }

  -- File explorer
  add { 'kyazdani42/nvim-tree.lua', 'patch.config.nvimtree' }

  -- Rooter changes the working directory to the project root when you open a file or directory.
  use 'airblade/vim-rooter'

  -- Notifications!
  -- Adds popup notification support
  add { 'rcarriga/nvim-notify', 'patch.config.nvim-notify' }

  -- Install status line support
  add { 'nvim-lualine/lualine.nvim', 'patch.config.lualine' }

  -- Install tab line support
  add { 'romgrk/barbar.nvim', 'patch.config.tabline' }

  -- Some tpope features
  use 'tpope/vim-obsession'
  use 'tpope/vim-fugitive'

  add { 'lewis6991/gitsigns.nvim', 'patch.config.gitsigns' }

  -- Improve the slash-search functionality
  use 'junegunn/vim-slash'

  -- Themes
  use {
    'sainnhe/gruvbox-material',
    'RRethy/nvim-base16',
  }

  ---------------------------
  --  Syntax and formats
  ---------------------------
  use 'isobit/vim-caddyfile'
  use 'alker0/chezmoi.vim'
end)
