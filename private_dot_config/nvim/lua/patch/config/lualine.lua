-- Component references
-- https://github.com/nvim-lualine/lualine.nvim#changing-components-in-lualine-sections
--
-- Available components
--
--      branch (git branch)
--      buffers (shows currently available buffers)
--      diagnostics (diagnostics count from your preferred source)
--      diff (git diff status)
--      encoding (file encoding)
--      fileformat (file format)
--      filename
--      filesize
--      filetype
--      hostname
--      location (location in file in line:column format)
--      mode (vim mode)
--      progress (%progress in file)
--      tabs (shows currently available tabs)
--      windows (shows currently available windows)

--[[ require "patch.utils".safe_setup('tabline', {
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = true, -- shows base filename only instead of relative path in filename
		modified_icon = "[+] ", -- change the default modified icon
		modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
		show_tabs_only = true, -- this shows only tabs instead of tabs + buffers
	}
}) ]]

require "patch.utils".safe_setup('lualine', {
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
		--theme = 'onedark',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { "NvimTree" },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { { 'filename', path = 1, file_status = true } },
		lualine_x = { 'filesize', 'filetype' },
		lualine_y = {},
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
})

--[[ {
		lualine_a = {
			{
				'buffers',
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = false, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.

				mode = 0, -- 0: Shows buffer name
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- 3: Shows buffer number
				-- 4: Shows buffer name + buffer number

				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- it can also be a function that returns
				-- the value of `max_length` dynamically.
				filetype_names = {
					TelescopePrompt = 'Telescope',
					dashboard = 'Dashboard',
					packer = 'Packer',
					fzf = 'FZF',
					alpha = 'Alpha',
					NvimTree = 'Nvim Tree'
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

				symbols = {
					modified = ' ●', -- Text to show when the buffer is modified
					alternate_file = '#', -- Text to show to identify the alternate file
					directory = '', -- Text to show when the buffer is a directory
				},
			}
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {

			{
				'tabs',
				max_length = vim.o.columns / 3, -- Maximum width of tabs component.

				-- Note:
				-- It can also be a function that returns
				-- the value of `max_length` dynamically.

				-- 0: Shows tab_nr
				-- 1: Shows tab_name
				-- 2: Shows tab_nr + tab_name
				mode = 0,
			}

		}
	} ]]

vim.cmd([[
    set guioptions-=e
    set sessionoptions+=tabpages,globals
]])
