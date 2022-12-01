local packages = { 'lspconfig', 'mason', 'mason-lspconfig', 'null-ls' }

-- Make sure we can safely load in our packages.
for _, pkg in pairs(packages) do
  if not pcall(require, pkg) then
    error('Unable to load package <' .. pkg .. '>')
    return
  end
end

-- Import our packages
local lspconfig = require 'lspconfig'
local mason = require 'mason'
local mason_lspconf = require 'mason-lspconfig'
local null = require 'null-ls'

-- Start configuring various LSP related items --

-- The float dialog config for lsp/hover
local lsp_hover_float_config = { border = 'rounded' }

-- Format the document on write
local formatOnSave = true
local format_timeout = 2500

-- Highlight the token under the cursor on cursor-hold
local highlightTokenUnderCursor = true

local mason_config = {}
local mason_lspconf_config = {}
local mason_null_ls_config = {
  automatic_installation = true,
  automatic_setup = true,
}

-- The typescript.nvim setup (faster than tsserver, plus more options)
local typescript_setup = {
  disable_commands = true,
  disable_formatting = true,
  debug = false,
  go_to_source_definition = { fallback = true },
}

-- The filetypes that prettier will run against
local prettier_filetypes = {
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
}

-- The null-ls sources to use
local sources = {
  -- Code actions
  require 'patch.code-actions.typescript',
  -- null.builtins.code_actions.cspell,
  -- null.builtins.code_actions.eslint_d,
  null.builtins.code_actions.gitsigns,

  -- Diagnostics
  -- null.builtins.diagnostics.cspell,
  null.builtins.diagnostics.cmake_lint,
  null.builtins.diagnostics.codespell,
  null.builtins.diagnostics.commitlint,
  null.builtins.diagnostics.cppcheck,
  null.builtins.diagnostics.cpplint,
  null.builtins.diagnostics.editorconfig_checker,
  -- null.builtins.diagnostics.eslint_d,
  null.builtins.diagnostics.gitlint,
  null.builtins.diagnostics.hadolint, -- Dockerfile helper

  -- Completion
  null.builtins.completion.tags,

  -- Formatting
  null.builtins.formatting.prettier.with { filetypes = prettier_filetypes, timeout = 5000 },
  null.builtins.formatting.stylua,
  null.builtins.formatting.clang_format,
}

-- LSP servers to configure with their defaults.
-- No overrides necessary!
local lspservers_default_configs = {
  'angularls',
  'bashls',
  'cssls',
  'html',
  'jsonls',
  'cssmodules_ls',
  'clangd',
  'diagnosticls',
  'dockerls',
  'emmet_ls',
  'vimls',
  'yamlls',
  'rust_analyzer',
}

-- These LSP servers have additional configuration applied.
local lspservers_extended_config = {
  -- Qt
  ['qmlls'] = { cmd = { 'qmlls6' } },

  -- Lua
  ['sumneko_lua'] = {
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),

          -- Don't check for third party tools
          checkThirdParty = false,
        },
        -- Do not send telemetry data
        telemetry = { enable = false },
      },
    },
  },
}

-- LspFormatting AutoCommand group
local lspFormatAUGroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- Shorthand to reduce typing.
local lsp = vim.lsp.buf

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local lsp_keymaps = {
  ['gD'] = lsp.declaration,
  ['gd'] = lsp.definition,
  ['K'] = lsp.hover,
  ['gi'] = lsp.implementation,
  ['gT'] = lsp.type_definition,
  ['<leader>rn'] = lsp.rename,
  ['<C-space>'] = lsp.code_action,
  ['gr'] = lsp.references,
  ['<leader>f'] = function()
    lsp.format { timeout_ms = format_timeout }
  end,
  -- ["<C-K>"] = lsp.signature_help,
  -- ['<leader>wa'] = lsp.add_workspace_folder,
  -- ['<leader>wr'] = lsp.remove_workspace_folder,
  -- ['<leader>wl'] = function() print(vim.inspect(lsp.list_workspace_folders())) end,
}

local function format(bufnr)
  local fmt = require('patch.utils.format').format_buffer
  return function()
    fmt(bufnr)
  end
end
-- Mappings.
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  for map, action in pairs(lsp_keymaps) do
    vim.keymap.set('n', map, action, opts)
  end

  -- Add the autocommands for highlighting under the cursor
  if highlightTokenUnderCursor and client.supports_method 'textDocument/documentHighlight' then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { callback = lsp.document_highlight, buffer = bufnr })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { callback = lsp.clear_references, buffer = bufnr })
  end

  -- Add the autocommands for formatting on save
  if formatOnSave and client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = lspFormatAUGroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = lspFormatAUGroup,
      buffer = bufnr,
      callback = format(bufnr),
    })
  end
end

-- Overwrite handlers for LSP entries
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, lsp_hover_float_config),
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local default_server_opts = { on_attach = on_attach, capabilities = capabilities, handlers = handlers }

-- At this point, it's just spinning things up.
-- Nothing particularly interesting, despite being
-- kinda important.

require('typescript').setup(vim.tbl_deep_extend('force', typescript_setup, { server = default_server_opts }))

mason.setup(mason_config)
mason_lspconf.setup(mason_lspconf_config)

null.setup {
  sources = sources,
  on_init = function(new_client, _)
    new_client.offset_encoding = 'utf-32'
  end,
}

require('mason-null-ls').setup(mason_null_ls_config)

local default_config = {}
for _, key in pairs(lspservers_default_configs) do
  default_config[key] = {}
end

-- The servers to configure
local lsp_servers = vim.tbl_deep_extend('force', {}, default_config, lspservers_extended_config)

for lsp, config in pairs(lsp_servers) do
  lspconfig[lsp].setup(vim.tbl_deep_extend('force', default_server_opts, config))
end
