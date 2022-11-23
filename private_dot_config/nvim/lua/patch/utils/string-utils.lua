local M = {}

M.trim = function(str) return str:gsub("^%s*(.-)%s*$", "%1") end

return M
