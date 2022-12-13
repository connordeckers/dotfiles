local ok, neoclip = pcall(require, "neoclip")

if not ok then
	return
end

neoclip.setup {
	history = 5000,
	enable_persistent_history = true,
	length_limit = 1048576,
	continuous_sync = true,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = nil,
	preview = true,
	default_register = '"',
	default_register_macros = 'q',
	enable_macro_history = true,
	content_spec_column = false,
	on_paste = { set_reg = true, },
	on_replay = { set_reg = false, },
	keys = {
		telescope = {
			i = {
				select = nil,
				paste = '<cr>',
				paste_behind = '<c-p>',
				replay = '<c-q>', -- replay a macro
				delete = '<c-d>', -- delete an entry
				custom = {},
			},
			n = {
				select = '<cr>',
				paste = 'p',
				paste_behind = 'P',
				replay = 'q',
				delete = 'd',
				custom = {},
			},
		}
	},
}
