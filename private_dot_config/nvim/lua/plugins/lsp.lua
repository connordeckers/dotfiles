local function lazy_load(package, method)
  return function(...)
    local success, pkg = pcall(require, package)
    if success then
      pkg[method](...)
    end
  end
end

local function with(package, callback)
  local exists, pkg = pcall(require, package)
  if not exists then
    return nil
  end

  return callback(pkg)
end

local function lazy(obj, args)
  return function()
    obj(args)
  end
end

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
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
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
    'junnplus/lsp-setup.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'neovim/nvim-lspconfig',
      { 'folke/neoconf.nvim', cmd = 'Neoconf' },
      { 'folke/neodev.nvim', opts = { experimental = { pathStrict = true } } },

      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- 'lvimuser/lsp-inlayhints.nvim',
      {
        'marilari88/twoslash-queries.nvim',
        opts = {
          multi_line = true, -- to print types in multi line mode
          is_enabled = true, -- to keep enabled at startup
        },
      },
    },

    opts = {
      -- Default mappings
      -- gD = 'lua vim.lsp.buf.declaration()',
      -- gd = 'lua vim.lsp.buf.definition()',
      -- gt = 'lua vim.lsp.buf.type_definition()',
      -- gi = 'lua vim.lsp.buf.implementation()',
      -- gr = 'lua vim.lsp.buf.references()',
      -- K = 'lua vim.lsp.buf.hover()',
      -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
      -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
      -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
      -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
      -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
      -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
      -- [']d'] = 'lua vim.diagnostic.goto_next()',
      default_mappings = false,
      mappings = {
        -- The below are handled by Telescope.nvim
        --  - vim.lsp.buf.declaration,
        --  - vim.lsp.buf.definition,
        --  - vim.lsp.buf.implementation,
        --  - vim.lsp.buf.type_definition,
        --  - vim.lsp.buf.references,
        --
        ['K'] = lazy_load('noice.lsp', 'hover'),
        ['<leader>rn'] = vim.lsp.buf.rename,
        ['<C-space>'] = vim.lsp.buf.code_action,
        ['<leader>f'] = lazy(vim.lsp.buf.format, { timeout_ms = 2500 }),
      },

      inlay_hints = {
        enabled = true,
        parameter_hints = true,
        type_hints = true,
        highlight = 'LspInlayHint',
        priority = 0,
      },

      servers = {
        -- Shell languages
        bashls = {},

        -- Editor specific features
        lua_ls = {
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = 'Auto',
                await = true,
                paramName = 'All',
                paramType = true,
                semicolon = 'SameLine',
                setType = false,
              },
            },
          },
        },
        vimls = {},

        -- System languages
        dockerls = {},
        yamlls = {
          params = {
            settings = {
              yaml = {
                -- FIX mapKeyOrder warning
                keyOrdering = false,
              },
            },
          },
        },
        rust_analyzer = {},
        pyright = {},

        -- Web languages
        angularls = {},
        cssls = {},
        html = {},
        jsonls = {},
        cssmodules_ls = {},
        emmet_ls = {},
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = function(client, bufnr)
        if client.name == 'tsserver' then
          with('twoslash-queries', function(twoslash)
            twoslash.attach(client, bufnr)
          end)
        end

        -- Add support for the symbol path
        if client.server_capabilities.documentSymbolProvider then
          with('nvim-navic', function(navic)
            navic.attach(client, bufnr)
          end)
        end

        -- Add the autocommands for highlighting under the cursor
        if client.supports_method 'textDocument/documentHighlight' then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { callback = vim.lsp.buf.document_highlight, buffer = bufnr })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { callback = vim.lsp.buf.clear_references, buffer = bufnr })
        end

        -- Add the autocommands for formatting on save
        if client.supports_method 'textDocument/formatting' then
          local lspFormatAUGroup = vim.api.nvim_create_augroup('LspFormatting', {})
          vim.api.nvim_clear_autocmds { group = lspFormatAUGroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = lspFormatAUGroup,
            buffer = bufnr,
            callback = function()
              require('utils.format').format_buffer(bufnr)
            end,
          })
        end
      end,
    },
  },

  {
    'windwp/nvim-autopairs',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
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

      -- Icons
      'onsails/lspkind.nvim',

      -- Copilot
      {
        'zbirenbaum/copilot-cmp',
        dependencies = {
          { 'zbirenbaum/copilot.lua', opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
          } },
        },
      },
    },

    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- If you want insert `(` after select function or method item

      local compare = cmp.config.compare
      local TriggerEvent = require('cmp.types').cmp.TriggerEvent

      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menu,menuone,noselect'

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
          format = require('lspkind').cmp_format {
            -- mode = 'text', -- show only text annotations
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            symbol_map = { Copilot = '' },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end,
          },
          -- format = function(entry, vim_item)
          --   local kind = require('lspkind').cmp_format { mode = 'symbol_text', maxwidth = 50, ellipsis_char = '...' }(entry, vim_item)
          --   local strings = vim.split(kind.kind, '%s', { trimempty = true })
          --   kind.kind = ' ' .. (strings[1] or '') .. ' '
          --   kind.menu = '    (' .. (strings[2] or '') .. ')'
          --
          --   return kind
          -- end,
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },

          ['<A-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<A-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
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
          { name = 'copilot', group_index = 2 },
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'path', group_index = 2 },
          { name = 'luasnip', max_item_count = 4 },
          --{ name = "nvim_lua" },
          { name = 'nvim_lsp_signature_help', group_index = 2 },
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
