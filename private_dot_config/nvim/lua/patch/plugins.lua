return require('patch.utils.bootstrap').bootstrap_packer(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Sync navigation with tmux
  -- use 'christoomey/vim-tmux-navigator'

  -- Lightspeed navigation!
  use 'ggandor/lightspeed.nvim'

  use 'mhinz/vim-startify'
  use 'petertriho/nvim-scrollbar'
  use 'Kasama/nvim-custom-diagnostic-highlight'

  use 'fladson/vim-kitty'

  use 'sindrets/winshift.nvim'
  use 'sindrets/diffview.nvim'
  -- Clipboard history
  --[[ use { ]]
  --[[ 	"connordeckers/neoclip", ]]
  --[[ 	requires = { { 'tami5/sqlite.lua', module = 'sqlite' } }, ]]
  --[[ } ]]

  use {
    'connordeckers/tmux-navigator.nvim',
    config = function()
      require('tmux-navigator').setup { enable = true }
    end,
  }

  use 'kylechui/nvim-surround'

  use 'caenrique/swap-buffers.nvim'

  use 'cshuaimin/ssr.nvim'

  ---------------------------
  --       Telescope
  ---------------------------

  -- Telescope and its peripheries
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-symbols.nvim',
      --[[ "nvim-telescope/telescope-file-browser.nvim", ]]
      --[[ "nvim-telescope/telescope-project.nvim", ]]
      'benfowler/telescope-luasnip.nvim',
    },
  }

  -- Make things PRETTY
  use 'stevearc/dressing.nvim'

  ---------------------------
  --      Tree Sitter
  ---------------------------

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'windwp/nvim-ts-autotag',

      -- Auto pair braces
      'windwp/nvim-autopairs',

      --"p00f/nvim-ts-rainbow",

      'ThePrimeagen/refactoring.nvim',

      -- Some additional treesitter functionality
      'nvim-treesitter/nvim-treesitter-textobjects',
      'theHamsta/nvim-treesitter-pairs',
      'JoosepAlviste/nvim-ts-context-commentstring',
      --[[ "nvim-treesitter/nvim-treesitter-refactor", ]]
      'nvim-treesitter/playground',
      'nvim-treesitter/tree-sitter-lua',
    },
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'jose-elias-alvarez/typescript.nvim',
    'ray-x/lsp_signature.nvim',
  }

  -- Debug Adaptor Protocol

  use 'mfussenegger/nvim-dap'

  use 'folke/trouble.nvim'

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
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
  }

  -- Add prettier support
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      --'MunifTanjim/prettier.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  ---------------------------
  --    Task management
  ---------------------------

  use 'Shatur/neovim-tasks'
  use {
    'BenGH28/neo-runner.nvim',
    run = ':UpdateRemotePlugins',
  }

  ---------------------------
  --          Misc
  ---------------------------

  -- Commenting tool
  use 'numtostr/comment.nvim'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Rooter changes the working directory to the project root when you open a file or directory.
  use 'airblade/vim-rooter'

  -- Notifications!
  use 'rcarriga/nvim-notify'

  -- Install lualine and tabline
  use {
    'nvim-lualine/lualine.nvim',
    --requires = { "kdheepak/tabline.nvim" }
  }

  use 'romgrk/barbar.nvim'

  -- Some tpope features
  --use "tpope/vim-surround"
  use 'tpope/vim-obsession'
  use 'tpope/vim-fugitive'

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

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
