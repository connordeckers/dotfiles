local rounded_border = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

return {
  {
    'Exafunction/codeium.vim',
    cmd = { 'Codeium' },
    keys = {
      {
        '<C-w>',
        function()
          vim.fn['codeium#CycleCompletions'](-1)
        end,
        mode = 'i',
        expr = true,
      },

      {
        '<C-s>',
        function()
          vim.fn['codeium#CycleCompletions'](1)
        end,
        mode = 'i',
        expr = true,
      },

      {
        '<C-a>',
        function()
          return vim.fn['codeium#Clear']()
        end,
        mode = 'i',
        expr = true,
      },

      {
        '<C-d>',
        function()
          return vim.fn['codeium#Accept']()
        end,
        mode = 'i',
        expr = true,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = {
      'TSInstall',
      'TSInstallSync',
      'TSInstallInfo',
      'TSUpdate',
      'TSUpdateSync',
      'TSUninstall',
      'TSBufEnable',
      'TSBufDisable',
      'TSBufToggle',
      'TSEnable',
      'TSDisable',
      'TSToggle',
      'TSModuleInfo',
      'TSEditQuery',
      'TSEditQueryUserAfter',
    },
    dependencies = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',

      'windwp/nvim-ts-autotag',
      'theHamsta/nvim-treesitter-pairs',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },

    config = function()
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

      -- local autocmd = require('patch.utils').nvim_create_augroups

      -- autocmd {
      --   open_folds = {
      --     { 'BufReadPost,FileReadPost', '*', 'normal zR' },
      --   },
      -- }

      require('nvim-treesitter.configs').setup {
        autotag = { enable = true },
        highlight = { enable = true },
        pairs = {
          enable = true,
          disable = {},
          highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
          highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
          goto_right_end = false, -- whether to go to the end of the right partner or the beginning
          fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
          keymaps = {
            goto_partner = '<leader>%',
            delete_balanced = 'X',
          },
          delete_balanced = {
            only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
            fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
            longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
            -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            scope_incremental = '<S-CR>',
            node_decremental = '<BS>',
          },
        },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aC'] = '@conditional.outer',
              ['iC'] = '@conditional.inner',
              ['aS'] = '@tag.self-closing',
              ['ap'] = '@json.property',
            },
          },
        },
        refactor = {
          -- Highlights definition and usages of the current symbol under the cursor.
          highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
          },

          -- Renames the symbol under the cursor within the current scope (and current file).
          -- Disabled; prefer using LSP, as it can rename the same symbol outside this file.
          smart_rename = { enable = false },

          -- Provides "go to definition" for the symbol under the cursor, and lists the definitions from the current file.
          -- If you use goto_definition_lsp_fallback instead of goto_definition in the config below vim.lsp.buf.definition
          -- is used if nvim-treesitter can not resolve the variable. goto_next_usage/goto_previous_usage go to the next usage
          -- of the identifier under the cursor.
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = 'gnd',
              list_definitions = 'gnD',
              list_definitions_toc = 'gO',
              goto_next_usage = '<a-*>',
              goto_previous_usage = '<a-#>',
            },
          },
        },

        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },

        -- View treesitter information directly in Neovim!
        playground = {
          enable = true,
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        },
      }
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      { 'jayp0521/mason-null-ls.nvim', opts = {
        automatic_installation = true,
        automatic_setup = true,
      } },
      -- 'jose-elias-alvarez/typescript.nvim',
    },

    opts = function()
      local nls = require 'null-ls'

      -- The null-ls sources to use
      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
        sources = {
          -- Code actions
          nls.builtins.code_actions.gitsigns,

          -- Diagnostics
          nls.builtins.diagnostics.cmake_lint,
          nls.builtins.diagnostics.commitlint,
          nls.builtins.diagnostics.cpplint,
          nls.builtins.diagnostics.gitlint,
          nls.builtins.diagnostics.hadolint,

          -- Completion
          nls.builtins.completion.tags,

          -- Formatting
          nls.builtins.formatting.prettier.with {
            filetypes = {
              'css',
              'graphql',
              'html',
              'javascript',
              'javascriptreact',
              'json',
              'less',
              'markdown',
              'scss',
              'typescript',
              'typescriptreact',
              'yaml',
            },
            timeout = 5000,
          },
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.clang_format,
          nls.builtins.formatting.black,
          nls.builtins.formatting.isort,
        },
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
      { 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },

      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- 'lvimuser/lsp-inlayhints.nvim',
    },

    opts = {
      -- Format the document on write
      format_on_save = true,

      -- Highlight the token under the cursor on cursor-hold
      highlightTokenUnderCursor = true,

      keymaps = {
        -- The below are handled by Telescope.nvim
        -- ['gD'] = vim.lsp.buf.declaration,
        -- ['gd'] = vim.lsp.buf.definition,
        -- ['gi'] = vim.lsp.buf.implementation,
        -- ['gT'] = vim.lsp.buf.type_definition,
        -- ['gr'] = vim.lsp.buf.references,
        --
        -- This is instead handled by noice
        -- ['K'] = vim.lsp.buf.hover,
        ['K'] = function()
          require('noice.lsp').hover()
        end,
        ['<leader>rn'] = vim.lsp.buf.rename,
        ['<C-space>'] = vim.lsp.buf.code_action,
        ['<leader>f'] = function()
          vim.lsp.buf.format { timeout_ms = 2500 }
        end,
        -- ["<C-K>"] = vim.lsp.buf.signature_help,
        -- ['<leader>wa'] = vim.lsp.buf.add_workspace_folder,
        -- ['<leader>wr'] = vim.lsp.buf.remove_workspace_folder,
        -- ['<leader>wl'] = function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      },

      config = {
        ['angularls'] = {},
        ['bashls'] = {},
        ['cssls'] = {},
        ['html'] = {},
        ['jsonls'] = {},
        ['cssmodules_ls'] = {},
        ['clangd'] = {},
        ['dockerls'] = {},
        ['emmet_ls'] = {},
        ['vimls'] = {},

        ['tsserver'] = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
            completions = {
              -- Complete functions with their parameter signature.
              --
              -- This functionality relies on LSP client resolving the completion using the `completionItem/resolve` call. If the
              -- client can't do that before inserting the completion then it's not safe to enable it as it will result in some
              -- completions having a snippet type without actually being snippets, which can then cause problems when inserting them.
              --
              -- @default false
              completeFunctionCalls = true,
            },
          },
        },

        ['yamlls'] = {},
        ['rust_analyzer'] = {},
        ['pyright'] = {},

        -- Qt
        ['qmlls'] = { cmd = { 'qmlls6' } },

        -- Lua

        ['lua_ls'] = {
          settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.tbl_deep_extend('force', {}, vim.api.nvim_get_runtime_file('', true)),

                -- Don't check for third party tools
                checkThirdParty = false,
              },

              -- Do not send telemetry data
              telemetry = { enable = false },
            },
          },
        },
      },
    },

    config = function(_, opts)
      local lsp = vim.lsp.buf

      -- LspFormatting AutoCommand group
      local lspFormatAUGroup = vim.api.nvim_create_augroup('LspFormatting', {})

      -- Mappings.
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        for map, action in pairs(opts.keymaps) do
          vim.keymap.set('n', map, action, { noremap = true, silent = true, buffer = bufnr })
        end

        local navic_exists, navic = pcall(require, 'nvim-navic')
        -- Add support for the symbol path
        if navic_exists and client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        -- Add the autocommands for highlighting under the cursor
        if opts.highlightTokenUnderCursor and client.supports_method 'textDocument/documentHighlight' then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { callback = lsp.document_highlight, buffer = bufnr })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { callback = lsp.clear_references, buffer = bufnr })
        end

        -- Add the autocommands for formatting on save
        if opts.format_on_save and client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = lspFormatAUGroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = lspFormatAUGroup,
            buffer = bufnr,
            callback = function()
              require('utils.format').format_buffer(bufnr)
            end,
          })
        end

        -- require('lsp-inlayhints').on_attach(client, bufnr)
      end

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local default_server_opts = { on_attach = on_attach, capabilities = capabilities }

      -- require('typescript').setup(vim.tbl_deep_extend('force', {
      --   disable_commands = true,
      --   disable_formatting = true,
      --   debug = false,
      --   go_to_source_definition = { fallback = true },
      -- }, { server = default_server_opts }))

      -- local default_config = {}
      -- for _, key in pairs(opts.config.default) do
      --   default_config[key] = {}
      -- end

      -- The servers to configure
      -- local lsp_servers = vim.tbl_deep_extend('force', {}, default_config, opts.config.extended)

      -- for lsp_server, config in pairs(lsp_servers) do
      for lsp_server, config in pairs(opts.config) do
        require('lspconfig')[lsp_server].setup(vim.tbl_deep_extend('force', default_server_opts, config))
      end
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = { 'BufReadPre', 'BufNewFile' },
    config = {
      check_ts = true,
      ts_config = {
        javascript = { 'template_string' },
        typescript = { 'template_string' },
      },
    },
  },

  -- cmdline tools and lsp servers
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    opts = {
      ui = {
        border = rounded_border,
        icons = {
          -- The list icon to use for installed packages.
          package_installed = ' ',
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = ' ',
          -- The list icon to use for packages that are not installed.
          package_uninstalled = ' ',
        },
      },
      ensure_installed = {},
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require 'mason-registry'
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  {
    'L3MON4D3/LuaSnip',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'honza/vim-snippets' },
    config = function()
      local types = require 'luasnip.util.types'
      -- Every unspecified option will be set to the default.
      require('luasnip').config.set_config {
        history = false,

        -- Update more often, :h events for more info.
        update_events = 'TextChanged,TextChangedI',

        -- Snippets aren't automatically removed if their text is deleted.
        -- `delete_check_events` determines on which events (:h events) a check for
        -- deleted snippets is performed.
        -- This can be especially useful when `history` is enabled.
        delete_check_events = 'TextChanged',

        ext_opts = {
          [types.choiceNode] = {
            active = { virt_text = { { 'choiceNode', 'Comment' } } },
          },
        },

        -- treesitter-hl has 100, use something higher (default is 200).
        ext_base_prio = 300,

        -- minimal increase in priority.
        ext_prio_increase = 1,
        enable_autosnippets = false,

        -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
        -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
        -- store_selection_keys = "<Tab>",

        -- luasnip uses this function to get the currently active filetype. This
        -- is the (rather uninteresting) default, but it's possible to use
        -- eg. treesitter for getting the current filetype by setting ft_func to
        -- require("luasnip.extras.filetype_functions").from_cursor (requires
        -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
        -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
        ft_func = function()
          return vim.split(vim.bo.filetype, '.', { plain = true })
        end,
      }

      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_snipmate').lazy_load()
      require 'snippets'
    end,
  },

  -- Autocompletion plugin
  {
    'hrsh7th/nvim-cmp',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'LuaSnip',
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

    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- If you want insert `(` after select function or method item

      local compare = cmp.config.compare
      local TriggerEvent = require('cmp.types').cmp.TriggerEvent

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
      end

      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menu,menuone,noselect'

      local icons = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '⌘',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '廓',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = '',
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        enabled = function()
          -- disable completion if the cursor is `Comment` syntax group.
          local context = require 'cmp.config.context'

          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture 'comment' and not context.in_syntax_group 'Comment'
          end
        end,

        completion = {
          keyword_length = 1,
          autocomplete = {
            TriggerEvent.InsertEnter,
            TriggerEvent.TextChanged,
          },
        },

        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]

            return vim_item
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.confirm { select = true }
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sorting = {
          comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },

        sources = cmp.config.sources {
          { name = 'luasnip', max_item_count = 4 },
          { name = 'nvim_lsp' },
          --{ name = "nvim_lua" },
          -- { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          --{ name = "buffer" },
        },

        preselect = cmp.PreselectMode.Item,
      }

      if not vim.g.autopair_confirm_attached then
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
        vim.g.autopair_confirm_attached = 1
      end

      cmp.setup.filetype('gitcommit', {
        -- You can specify the `cmp_git` source if you were installed it.
        sources = cmp.config.sources({ { name = 'cmp_git' } }, { { name = 'buffer' } }),
      })
    end,
  },
}
