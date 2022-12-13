local lualine = require 'lualine'
local navic = require 'nvim-navic'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
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
    lualine_x = { 'filesize', 'filetype' },
    lualine_y = {},
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
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { navic.get_location, cond = navic.is_available } },
    lualine_z = {},
  },
  extensions = {},
}

vim.cmd [[
    set guioptions-=e
    set sessionoptions+=tabpages,globals
]]
