local M = {}

local function filter(client)
  return client.name == 'null-ls'
  --return client.name ~= "html"
end

function M.format_buffer(bufnr)
  local args = { filter = filter, timeout_ms = 10000 }
  return vim.lsp.buf.format(args)
end

return M
