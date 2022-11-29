local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local with_defaults = {
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

local default_config = {}
for _, key in pairs(with_defaults) do
  default_config[key] = {}
end

local extended_config = {
  -- Qt
  ['qmlls'] = {
    cmd = { 'qmlls6' },
  },

  -- Lua
  -- ["sumneko_lua"] = {}
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
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

-- if you want to set up formatting on save, you can use this as a callback
local lspFormatAUGroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp = vim.lsp.buf

local lsp_keymaps = {
  ['gD'] = lsp.declaration,
  ['gd'] = lsp.definition,
  ['K'] = lsp.hover,
  ['gi'] = lsp.implementation,
  -- ["<C-K>"] = lsp.signature_help,
  ['<leader>wa'] = lsp.add_workspace_folder,
  ['<leader>wr'] = lsp.remove_workspace_folder,
  ['<leader>wl'] = function()
    print(vim.inspect(lsp.list_workspace_folders()))
  end,
  ['gT'] = lsp.type_definition,
  ['<leader>rn'] = lsp.rename,
  ['<C-space>'] = lsp.code_action,
  ['gr'] = lsp.references,
  ['<leader>f'] = lsp.format,
}

-- Mappings.
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true, buffer = bufnr }
  for map, action in pairs(lsp_keymaps) do
    vim.keymap.set('n', map, action, opts)
  end

  if client.supports_method 'textDocument/documentHighlight' then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { callback = lsp.document_highlight, buffer = bufnr })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { callback = lsp.clear_references, buffer = bufnr })
  end

  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = lspFormatAUGroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = lspFormatAUGroup,
      buffer = bufnr,
      callback = function()
        require('patch.utils.format').format_buffer(bufnr)
      end,
    })
  end
end

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local default_server_opts = { on_attach = on_attach, capabilities = capabilities, handlers = handlers }

require('typescript').setup {
  disable_commands = true,
  disable_formatting = true,
  debug = false,
  go_to_source_definition = { fallback = true },
  server = default_server_opts,
}

local default_servers = vim.tbl_deep_extend('force', {}, default_config, extended_config)

for lsp, config in pairs(default_servers) do
  local opts = vim.tbl_deep_extend('force', default_server_opts, config)

  lspconfig[lsp].setup(opts)
end
