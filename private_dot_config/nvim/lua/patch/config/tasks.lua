local Path = require('plenary.path')
require('tasks').setup({
  -- Default module parameters with which `neovim.json` will be created.
	default_params = {
    cmake = {
			-- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
      cmd = 'cmake',

			-- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded 
			-- with the corresponding text values. Could be a function that return the path to the build directory.
      build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')),

			-- Build type, can be changed using `:Task set_module_param cmake build_type`.
			build_type = 'Debug',

			-- DAP configuration name from `require('dap').configurations`. If there is no such configuration, 
			-- a new one with this name as `type` will be created.
			dap_name = 'lldb',

      args = { -- Task default arguments.
        configure = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
      },
    },
  },

	-- If true, all files will be saved before executing a task.
  save_before_run = true,

	-- JSON file to store module and task parameters.
	params_file = 'neovim.json',

	-- Default quickfix position.
	quickfix = {
    pos = 'botright',
    height = 12, -- Default height.
  },

	-- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or 
	-- `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
  dap_open_command = function() return require('dap').repl.open() end,
})
