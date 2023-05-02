return {
  -- Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    config = {
      flavour = 'frappe', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = { enabled = false },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },

  -- Make it easier to use search functionality
  { 'junegunn/vim-slash', event = 'BufRead' },

  -- Make things PRETTY
  {
    'stevearc/dressing.nvim',
    config = {
      input = {
        -- Can be 'left', 'right', or 'center'
        prompt_align = 'center',

        -- These are passed to nvim_open_win
        anchor = 'NW',
        border = 'rounded',

        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        win_options = {
          -- Window transparency (0-100)
          -- This fixes the black background in float windows
          winblend = 0,
        },
      },

      select = {
        -- Options for nui Menu
        nui = { border = { style = 'rounded' } },

        -- Options for built-in selector
        builtin = { border = 'rounded' },
      },
    },
  },

  -- local banned_messages = { 'No information available', 'multiple different client offset_encodings' }
  {
    'folke/noice.nvim',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = {
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI

        --- @type table<string, CmdlineFormat>
        format = {
          lua = { pattern = '^:%s*lua=?%s+', icon = '', lang = 'lua' },
          input = {},
        },
      },

      -- You can add any custom commands below that will be available with `:Noice command`
      ---@type table<string, NoiceCommand>
      commands = {},

      lsp = {
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },

        hover = {
          enabled = true,
          opts = { border = 'rounded' },
        },

        signature = {
          enabled = true,
          opts = { border = 'rounded' },
        },
      },

      ---@type NoicePresets
      presets = {
        -- you can enable a preset by setting it to true, or a table that will override the preset config
        -- you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      ---@type NoiceConfigViews
      views = {
        mini = {
          win_options = {
            winblend = 0, -- Make background transparent for nice acrylic finish
          },
        },
      }, ---@see section on views

      ---@type NoiceRouteConfig[]
      routes = {
        {
          filter = {
            any = {
              { find = 'search hit' },
              { find = 'Diagnosing' },
              { find = 'Processing full semantic tokens' },
              { find = 'No information available' },
            },
          },
          opts = { skip = true },
        },

        {
          filter = {
            any = {
              { find = 'Pattern not found' },
              { find = 'cwd:' },
              { find = 'written' },
            },
          },
          view = 'mini',
        },
      }, --- @see section on routes

      ---@type table<string, NoiceFilter>
      status = {}, --- @see section on statusline components

      ---@type NoiceFormatOptions
      format = {}, --- @see section on formatting
    },
  },

  -- Zen mode
  {
    'folke/zen-mode.nvim',
    keys = {
      {
        '<leader>zz',
        function()
          require('zen-mode').toggle()
        end,
      },
    },
    dependencies = {
      {
        'folke/twilight.nvim',
        config = {
          dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { 'Normal', '#ffffff' },
            term_bg = '#000000', -- if guibg=NONE, this will be used to calculate text color
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 10, -- amount of lines we will try to show around the current line
          treesitter = true, -- use treesitter when available for the filetype
        },
      },
    },
    config = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 0.75, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          foldcolumn = '0', -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
      },
    },
  },

  -- Scrollbar
  {
    'petertriho/nvim-scrollbar',
    event = { 'BufReadPre', 'BufNewFile' },
    config = {
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
      max_lines = false, -- disables if no. of lines in buffer exceeds this
      handle = {
        text = ' ',
        color = nil,
        cterm = nil,
        highlight = 'CursorColumn',
        hide_if_all_visible = true, -- Hides handle if all lines are visible
      },
      marks = {
        Search = {
          text = { '-', '=' },
          priority = 0,
          color = nil,
          cterm = nil,
          highlight = 'Search',
        },
        Error = {
          text = { '-', '=' },
          priority = 1,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextError',
        },
        Warn = {
          text = { '-', '=' },
          priority = 2,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextWarn',
        },
        Info = {
          text = { '-', '=' },
          priority = 3,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextInfo',
        },
        Hint = {
          text = { '-', '=' },
          priority = 4,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextHint',
        },
        Misc = {
          text = { '-', '=' },
          priority = 5,
          color = nil,
          cterm = nil,
          highlight = 'Normal',
        },
      },
      excluded_buftypes = {
        'terminal',
        'NvimTree',
      },
      excluded_filetypes = {
        'prompt',
        'TelescopePrompt',
      },
      autocmd = {
        render = {
          'BufWinEnter',
          'TabEnter',
          'TermEnter',
          'WinEnter',
          'CmdwinLeave',
          'TextChanged',
          'VimResized',
          'WinScrolled',
        },
        clear = {
          'BufWinLeave',
          'TabLeave',
          'TermLeave',
          'WinLeave',
        },
      },
      handlers = {
        diagnostic = true,
        search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
      },
    },
  },

  -- Status and buffer bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'smiteshp/nvim-navic', 'nvim-tree/nvim-web-devicons' },
    config = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- theme = 'rose-pine',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1, file_status = true } },
        lualine_x = {
          'filesize',
          'filetype',
        },
        lualine_y = {
          -- { noice.message.get_hl, cond = noice.message.has },
          -- { noice.command.get_hl, cond = noice.command.has },
          -- { noice.mode.get_hl, cond = noice.mode.has },
          -- { noice.search.get_hl, cond = noice.search.has },
        },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    },
  },

  -------------------
  -- Tab management
  -------------------
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {},
    lazy = false,
    keys = {
      { '<C-t>', '<cmd>tabnew<cr>' }, -- New tab
      { '<Leader>q', '<cmd>BufferClose<cr>' }, -- Close the current buffer
      { '<Leader>Q', '<cmd>BufferClose!<cr>' }, -- Close the current buffer
      { '<Tab>', '<cmd>BufferNext<cr>' }, -- Next tab
      { '<S-Tab>', '<cmd>BufferPrevious<cr>' }, -- Previous tab
    },
  },

  {
    'utilyre/barbecue.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'smiteshp/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = {
      ---whether to attach navic to language servers automatically
      ---@type boolean
      attach_navic = true,

      ---whether to create winbar updater autocmd
      ---@type boolean
      create_autocmd = true,

      ---buftypes to enable winbar in
      ---@type string[]
      include_buftypes = { '' },

      ---filetypes not to enable winbar in
      ---@type string[]
      exclude_filetypes = { 'toggleterm' },

      modifiers = {
        ---filename modifiers applied to dirname
        ---@type string
        dirname = ':~:.',

        ---filename modifiers applied to basename
        ---@type string
        basename = '',
      },

      ---returns a string to be shown at the end of winbar
      ---@type fun(bufnr: number): string
      custom_section = function()
        return ''
      end,

      ---whether to replace file icon with the modified symbol when buffer is modified
      ---@type boolean
      show_modified = false,

      symbols = {
        ---modification indicator
        ---@type string
        modified = '●',

        ---truncation indicator
        ---@type string
        ellipsis = '…',

        ---entry separator
        ---@type string
        separator = '',
      },

      ---icons for different context entry kinds
      ---`false` to disable kind icons
      ---@type table<string, string>|false
      kinds = {
        File = '',
        Package = '',
        Module = '',
        Namespace = '',
        Macro = '',
        Class = '',
        Constructor = '',
        Field = '',
        Property = '',
        Method = '',
        Struct = '',
        Event = '',
        Interface = '',
        Enum = '',
        EnumMember = '',
        Constant = '',
        Function = '',
        TypeParameter = '',
        Variable = '',
        Operator = '',
        Null = '',
        Boolean = '',
        Number = '',
        String = '',
        Key = '',
        Array = '',
        Object = '',
      },
    },
  },
}
