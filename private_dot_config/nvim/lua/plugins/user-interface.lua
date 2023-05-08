return {
  -- Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    opts = {
      flavour = 'frappe', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = { enabled = false },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },

  -- Handle the icons
  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      override = {
        -- -- File names
        -- ['.babelrc'] = {
        --   -- icon = '.',
        --   icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Babelrc',
        -- },
        -- ['.bash_profile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'BashProfile',
        -- },
        -- ['.bashrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Bashrc',
        -- },
        -- ['.ds_store'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'DsStore',
        -- },
        -- ['.eslintrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#4b32c3',
        --   cterm_color = '56',
        --   name = 'Eslintrc',
        -- },
        -- ['.gitattributes'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'GitAttributes',
        -- },
        -- ['.gitconfig'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'GitConfig',
        -- },
        -- ['.gitignore'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'GitIgnore',
        -- },
        -- ['.gitlab-ci.yml'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#e24329',
        --   cterm_color = '196',
        --   name = 'GitlabCI',
        -- },
        -- ['.gitmodules'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'GitModules',
        -- },
        -- ['.gvimrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Gvimrc',
        -- },
        -- ['.npmignore'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#E8274B',
        --   cterm_color = '197',
        --   name = 'NPMIgnore',
        -- },
        -- ['.npmrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#E8274B',
        --   cterm_color = '197',
        --   name = 'NPMrc',
        -- },
        -- ['.settings.json'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#854CC7',
        --   cterm_color = '98',
        --   name = 'SettingsJson',
        -- },
        -- ['.vimrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Vimrc',
        -- },
        -- ['.zprofile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Zshprofile',
        -- },
        -- ['.zshenv'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Zshenv',
        -- },
        -- ['.zshrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Zshrc',
        -- },
        -- ['brewfile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Brewfile',
        -- },
        -- ['cmakelists.txt'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'CMakeLists',
        -- },
        -- ['commit_editmsg'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'GitCommit',
        -- },
        ['containerfile'] = {
          icon = '.',
          --icon = "",
          color = '#458ee6',
          cterm_color = '68',
          name = 'Dockerfile',
        },
        -- ['copying'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'License',
        -- },
        -- ['copying.lesser'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'License',
        -- },
        ['docker-compose.yml'] = {
          -- icon = '.',
          icon = '',
          color = '#458ee6',
          cterm_color = '68',
          name = 'Dockerfile',
        },
        ['docker-compose.yaml'] = {
          icon = '.',
          --icon = "",
          color = '#458ee6',
          cterm_color = '68',
          name = 'Dockerfile',
        },
        ['.dockerignore'] = {
          icon = '.',
          --icon = "",
          color = '#458ee6',
          cterm_color = '68',
          name = 'Dockerfile',
        },
        -- ['gemfile$'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Gemfile',
        -- },
        -- ['vagrantfile$'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#1563FF',
        --   cterm_color = '27',
        --   name = 'Vagrantfile',
        -- },
        -- ['_gvimrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Gvimrc',
        -- },
        -- ['_vimrc'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Vimrc',
        -- },
        -- ['package.json'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#e8274b',
        --   name = 'PackageJson',
        -- },
        -- ['package-lock.json'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#7a0d21',
        --   name = 'PackageLockJson',
        -- },
        -- ['node_modules'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#E8274B',
        --   cterm_color = '197',
        --   name = 'NodeModules',
        -- },
        -- ['favicon.ico'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Favicon',
        -- },
        -- ['mix.lock'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'MixLock',
        -- },
        -- ['.env'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#faf743',
        --   cterm_color = '227',
        --   name = 'Env',
        -- },
        -- ['gruntfile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Gruntfile',
        -- },
        -- ['gulpfile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#cc3e44',
        --   cterm_color = '167',
        --   name = 'Gulpfile',
        -- },
        -- ['rakefile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Rakefile',
        -- },
        -- ['procfile'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Procfile',
        -- },
        ['dockerfile'] = {
          icon = '.',
          --icon = "",
          color = '#458ee6',
          cterm_color = '68',
          name = 'Dockerfile',
        },
        -- ['build'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'BazelBuild',
        -- },
        -- ['workspace'] = {
        --   icon = '.',
        --   --icon = "",
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'BazelWorkspace',
        -- },
        --
        -- -- File types
        -- ['ai'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Ai',
        -- },
        -- ['awk'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#4d5a5e',
        --   cterm_color = '240',
        --   name = 'Awk',
        -- },
        -- ['bash'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Bash',
        -- },
        -- ['bat'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#C1F12E',
        --   cterm_color = '191',
        --   name = 'Bat',
        -- },
        -- ['bazel'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Bazel',
        -- },
        -- ['bzl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Bzl',
        -- },
        -- ['bmp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Bmp',
        -- },
        -- ['c'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#599eff',
        --   cterm_color = '111',
        --   name = 'C',
        -- },
        -- ['c++'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f34b7d',
        --   cterm_color = '204',
        --   name = 'CPlusPlus',
        -- },
        -- ['cbl'] = {
        --   icon = '.',
        --   --icon = '⚙',
        --   color = '#005ca5',
        --   cterm_color = '25',
        --   name = 'Cobol',
        -- },
        -- ['cc'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f34b7d',
        --   cterm_color = '204',
        --   name = 'CPlusPlus',
        -- },
        -- ['cfg'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ECECEC',
        --   cterm_color = '255',
        --   name = 'Configuration',
        -- },
        -- ['cjs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Cjs',
        -- },
        -- ['clj'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#8dc149',
        --   cterm_color = '113',
        --   name = 'Clojure',
        -- },
        -- ['cljc'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#8dc149',
        --   cterm_color = '113',
        --   name = 'ClojureC',
        -- },
        -- ['cljs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'ClojureJS',
        -- },
        -- ['cljd'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'ClojureDart',
        -- },
        -- ['cmake'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'CMake',
        -- },
        -- ['cob'] = {
        --   icon = '.',
        --   --icon = '⚙',
        --   color = '#005ca5',
        --   cterm_color = '25',
        --   name = 'Cobol',
        -- },
        -- ['cobol'] = {
        --   icon = '.',
        --   --icon = '⚙',
        --   color = '#005ca5',
        --   cterm_color = '25',
        --   name = 'Cobol',
        -- },
        -- ['coffee'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Coffee',
        -- },
        -- ['conf'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Conf',
        -- },
        -- ['config.ru'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'ConfigRu',
        -- },
        -- ['cp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Cp',
        -- },
        -- ['cpp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Cpp',
        -- },
        -- ['cpy'] = {
        --   icon = '.',
        --   --icon = '⚙',
        --   color = '#005ca5',
        --   cterm_color = '25',
        --   name = 'Cobol',
        -- },
        -- ['cr'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#c8c8c8',
        --   cterm_color = '251',
        --   name = 'Crystal',
        -- },
        -- ['cs'] = {
        --   icon = '.',
        --   --icon = '󰌛',
        --   color = '#596706',
        --   cterm_color = '58',
        --   name = 'Cs',
        -- },
        -- ['csh'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#4d5a5e',
        --   cterm_color = '240',
        --   name = 'Csh',
        -- },
        -- ['cson'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Cson',
        -- },
        -- ['css'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#42a5f5',
        --   cterm_color = '75',
        --   name = 'Css',
        -- },
        -- ['csv'] = {
        --   icon = '.',
        --   --icon = '󰈙',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Csv',
        -- },
        -- ['cxx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Cxx',
        -- },
        -- ['d'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#427819',
        --   cterm_color = '28',
        --   name = 'D',
        -- },
        -- ['dart'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#03589C',
        --   cterm_color = '25',
        --   name = 'Dart',
        -- },
        -- ['db'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dad8d8',
        --   cterm_color = '188',
        --   name = 'Db',
        -- },
        -- ['desktop'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#563d7c',
        --   cterm_color = '54',
        --   name = 'DesktopEntry',
        -- },
        -- ['diff'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#41535b',
        --   cterm_color = '239',
        --   name = 'Diff',
        -- },
        -- ['doc'] = {
        --   icon = '.',
        --   --icon = '󰈬',
        --   color = '#185abd',
        --   cterm_color = '26',
        --   name = 'Doc',
        -- },
        -- ['docx'] = {
        --   icon = '.',
        --   --icon = '󰈬',
        --   color = '#185abd',
        --   cterm_color = '26',
        --   name = 'Docx',
        -- },
        -- ['drl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffafaf',
        --   cterm_color = '217',
        --   name = 'Drools',
        -- },
        -- ['dropbox'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#0061FE',
        --   cterm_color = '27',
        --   name = 'Dropbox',
        -- },
        -- ['dump'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dad8d8',
        --   cterm_color = '188',
        --   name = 'Dump',
        -- },
        -- ['edn'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Edn',
        -- },
        -- ['eex'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Eex',
        -- },
        -- ['ejs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Ejs',
        -- },
        -- ['elm'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Elm',
        -- },
        -- ['epp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#FFA61A',
        --   name = 'Epp',
        -- },
        -- ['erb'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#701516',
        --   cterm_color = '214',
        --   name = 'Erb',
        -- },
        -- ['erl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#B83998',
        --   cterm_color = '163',
        --   name = 'Erl',
        -- },
        -- ['ex'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Ex',
        -- },
        -- ['exs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Exs',
        -- },
        -- ['f#'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Fsharp',
        -- },
        -- ['f90'] = {
        --   icon = '.',
        --   --icon = '󱈚',
        --   color = '#734f96',
        --   cterm_color = '97',
        --   name = 'Fortran',
        -- },
        -- ['fnl'] = {
        --   color = '#fff3d7',
        --   icon = '.',
        --   --icon = '🌜',
        --   cterm_color = '230',
        --   name = 'Fennel',
        -- },
        -- ['fish'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#4d5a5e',
        --   cterm_color = '240',
        --   name = 'Fish',
        -- },
        -- ['fs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Fs',
        -- },
        -- ['fsi'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Fsi',
        -- },
        -- ['fsscript'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Fsscript',
        -- },
        -- ['fsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Fsx',
        -- },
        -- ['gd'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'GDScript',
        -- },
        -- ['gemspec'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Gemspec',
        -- },
        -- ['gif'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Gif',
        -- },
        -- ['git'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#F14C28',
        --   cterm_color = '196',
        --   name = 'GitLogo',
        -- },
        -- ['glb'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#FFB13B',
        --   cterm_color = '214',
        --   name = 'BinaryGLTF',
        -- },
        -- ['go'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Go',
        -- },
        -- ['godot'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'GodotProject',
        -- },
        -- ['graphql'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e535ab',
        --   cterm_color = '199',
        --   name = 'GraphQL',
        -- },
        -- ['gql'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e535ab',
        --   cterm_color = '199',
        --   name = 'GraphQL',
        -- },
        -- ['h'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'H',
        -- },
        -- ['haml'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#eaeae1',
        --   cterm_color = '255',
        --   name = 'Haml',
        -- },
        -- ['hbs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f0772b',
        --   cterm_color = '202',
        --   name = 'Hbs',
        -- },
        -- ['heex'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Heex',
        -- },
        -- ['hh'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Hh',
        -- },
        -- ['hpp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Hpp',
        -- },
        -- ['hrl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#B83998',
        --   cterm_color = '163',
        --   name = 'Hrl',
        -- },
        -- ['hs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Hs',
        -- },
        -- ['htm'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e34c26',
        --   cterm_color = '196',
        --   name = 'Htm',
        -- },
        -- ['html'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e44d26',
        --   cterm_color = '196',
        --   name = 'Html',
        -- },
        -- ['hxx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Hxx',
        -- },
        -- ['ico'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Ico',
        -- },
        -- ['import'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ECECEC',
        --   cterm_color = '255',
        --   name = 'ImportConfiguration',
        -- },
        -- ['ini'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Ini',
        -- },
        -- ['java'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cc3e44',
        --   cterm_color = '167',
        --   name = 'Java',
        -- },
        -- ['jl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a270ba',
        --   cterm_color = '133',
        --   name = 'Jl',
        -- },
        -- ['jpeg'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Jpeg',
        -- },
        -- ['jpg'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Jpg',
        -- },
        -- ['js'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Js',
        -- },
        -- ['test.js'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'TestJs',
        -- },
        -- ['spec.js'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'SpecJs',
        -- },
        -- ['json'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Json',
        -- },
        -- ['json5'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'Json5',
        -- },
        -- ['jsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#20c2e3',
        --   cterm_color = '45',
        --   name = 'Jsx',
        -- },
        -- ['test.jsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#20c2e3',
        --   cterm_color = '45',
        --   name = 'JavaScriptReactTest',
        -- },
        -- ['spec.jsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#20c2e3',
        --   cterm_color = '45',
        --   name = 'JavaScriptReactSpec',
        -- },
        -- ['ksh'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#4d5a5e',
        --   cterm_color = '240',
        --   name = 'Ksh',
        -- },
        -- ['kt'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#7F52FF',
        --   cterm_color = '99',
        --   name = 'Kotlin',
        -- },
        -- ['kts'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#7F52FF',
        --   cterm_color = '99',
        --   name = 'KotlinScript',
        -- },
        -- ['leex'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Leex',
        -- },
        -- ['less'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#563d7c',
        --   cterm_color = '54',
        --   name = 'Less',
        -- },
        -- ['lhs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Lhs',
        -- },
        -- ['license'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'License',
        -- },
        -- ['lua'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#51a0cf',
        --   cterm_color = '74',
        --   name = 'Lua',
        -- },
        -- ['luau'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#51a0cf',
        --   cterm_color = '74',
        --   name = 'Luau',
        -- },
        -- ['gnumakefile'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Makefile',
        -- },
        -- ['makefile'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Makefile',
        -- },
        -- ['mk'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Makefile',
        -- },
        -- ['markdown'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Markdown',
        -- },
        -- ['material'] = {
        --   icon = '.',
        --   --icon = '󰔉',
        --   color = '#B83998',
        --   cterm_color = '163',
        --   name = 'Material',
        -- },
        -- ['md'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffffff',
        --   cterm_color = '231',
        --   name = 'Md',
        -- },
        -- ['mdx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Mdx',
        -- },
        -- ['mint'] = {
        --   icon = '.',
        --   --icon = '󰌪',
        --   color = '#87c095',
        --   cterm_color = '108',
        --   name = 'Mint',
        -- },
        -- ['mjs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f1e05a',
        --   cterm_color = '185',
        --   name = 'Mjs',
        -- },
        -- ['ml'] = {
        --   icon = '.',
        --   --icon = 'λ',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Ml',
        -- },
        -- ['mli'] = {
        --   icon = '.',
        --   --icon = 'λ',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Mli',
        -- },
        -- ['mo'] = {
        --   icon = '.',
        --   --icon = '∞',
        --   color = '#9772FB',
        --   cterm_color = '135',
        --   name = 'Motoko',
        -- },
        -- ['mustache'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Mustache',
        -- },
        -- ['nim'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f3d400',
        --   cterm_color = '220',
        --   name = 'Nim',
        -- },
        -- ['nix'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#7ebae4',
        --   cterm_color = '110',
        --   name = 'Nix',
        -- },
        -- ['opus'] = {
        --   icon = '.',
        --   --icon = '󰈣',
        --   color = '#F88A02',
        --   cterm_color = '208',
        --   name = 'OPUS',
        -- },
        -- ['org'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#77AA99',
        --   cterm_color = '73',
        --   name = 'OrgMode',
        -- },
        -- ['otf'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ECECEC',
        --   cterm_color = '255',
        --   name = 'OpenTypeFont',
        -- },
        -- ['pck'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'PackedResource',
        -- },
        -- ['pdf'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#b30b00',
        --   cterm_color = '124',
        --   name = 'Pdf',
        -- },
        -- ['php'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Php',
        -- },
        -- ['pl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Pl',
        -- },
        -- ['pm'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Pm',
        -- },
        -- ['png'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Png',
        -- },
        -- ['pp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#FFA61A',
        --   name = 'Pp',
        -- },
        -- ['ppt'] = {
        --   icon = '.',
        --   --icon = '󰈧',
        --   color = '#cb4a32',
        --   cterm_color = '214',
        --   name = 'Ppt',
        -- },
        -- ['pro'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e4b854',
        --   cterm_color = '179',
        --   name = 'Prolog',
        -- },
        -- ['ps1'] = {
        --   icon = '.',
        --   --icon = '󰨊',
        --   color = '#4273ca',
        --   cterm_color = '68',
        --   name = 'PsScriptfile',
        -- },
        -- ['psd1'] = {
        --   icon = '.',
        --   --icon = '󰨊',
        --   color = '#6975c4',
        --   cterm_color = '68',
        --   name = 'PsManifestfile',
        -- },
        -- ['psm1'] = {
        --   icon = '.',
        --   --icon = '󰨊',
        --   color = '#6975c4',
        --   cterm_color = '68',
        --   name = 'PsScriptModulefile',
        -- },
        -- ['psb'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Psb',
        -- },
        -- ['psd'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Psd',
        -- },
        -- ['py'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffbc03',
        --   cterm_color = '214',
        --   name = 'Py',
        -- },
        -- ['pyc'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffe291',
        --   cterm_color = '222',
        --   name = 'Pyc',
        -- },
        -- ['pyd'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffe291',
        --   cterm_color = '222',
        --   name = 'Pyd',
        -- },
        -- ['pyo'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ffe291',
        --   cterm_color = '222',
        --   name = 'Pyo',
        -- },
        -- ['query'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#90a850',
        --   cterm_color = '107',
        --   name = 'Query',
        -- },
        -- ['r'] = {
        --   icon = '.',
        --   --icon = '󰟔',
        --   color = '#358a5b',
        --   cterm_color = '29',
        --   name = 'R',
        -- },
        -- ['rake'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Rake',
        -- },
        -- ['rb'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#701516',
        --   cterm_color = '52',
        --   name = 'Rb',
        -- },
        -- ['res'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cc3e44',
        --   cterm_color = '167',
        --   name = 'ReScript',
        -- },
        -- ['resi'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f55385',
        --   cterm_color = '204',
        --   name = 'ReScriptInterface',
        -- },
        -- ['rlib'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dea584',
        --   cterm_color = '216',
        --   name = 'Rlib',
        -- },
        -- ['rmd'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Rmd',
        -- },
        -- ['rproj'] = {
        --   icon = '.',
        --   --icon = '󰗆',
        --   color = '#358a5b',
        --   cterm_color = '29',
        --   name = 'Rproj',
        -- },
        -- ['rs'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dea584',
        --   cterm_color = '216',
        --   name = 'Rs',
        -- },
        -- ['rss'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#FB9D3B',
        --   cterm_color = '215',
        --   name = 'Rss',
        -- },
        -- ['sass'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f55385',
        --   cterm_color = '204',
        --   name = 'Sass',
        -- },
        -- ['sbt'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cc3e44',
        --   cterm_color = '167',
        --   name = 'sbt',
        -- },
        -- ['scala'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cc3e44',
        --   cterm_color = '167',
        --   name = 'Scala',
        -- },
        -- ['scm'] = {
        --   icon = '.',
        --   --icon = '󰘧',
        --   color = '#000000',
        --   cterm_color = '16',
        --   name = 'Scheme',
        -- },
        -- ['scss'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f55385',
        --   cterm_color = '204',
        --   name = 'Scss',
        -- },
        -- ['sh'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#4d5a5e',
        --   cterm_color = '240',
        --   name = 'Sh',
        -- },
        -- ['sig'] = {
        --   icon = '.',
        --   --icon = 'λ',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Sig',
        -- },
        -- ['slim'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e34c26',
        --   cterm_color = '196',
        --   name = 'Slim',
        -- },
        -- ['sln'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#854CC7',
        --   cterm_color = '98',
        --   name = 'Sln',
        -- },
        -- ['sml'] = {
        --   icon = '.',
        --   --icon = 'λ',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Sml',
        -- },
        -- ['sql'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dad8d8',
        --   cterm_color = '188',
        --   name = 'Sql',
        -- },
        -- ['sqlite'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dad8d8',
        --   cterm_color = '188',
        --   name = 'Sql',
        -- },
        -- ['sqlite3'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#dad8d8',
        --   cterm_color = '188',
        --   name = 'Sql',
        -- },
        -- ['styl'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#8dc149',
        --   cterm_color = '113',
        --   name = 'Styl',
        -- },
        -- ['sublime'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Suo',
        -- },
        -- ['suo'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#854CC7',
        --   cterm_color = '98',
        --   name = 'Suo',
        -- },
        -- ['sv'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'SystemVerilog',
        -- },
        -- ['svelte'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#ff3e00',
        --   cterm_color = '196',
        --   name = 'Svelte',
        -- },
        -- ['svh'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'SystemVerilog',
        -- },
        -- ['svg'] = {
        --   icon = '.',
        --   --icon = '󰜡',
        --   color = '#FFB13B',
        --   cterm_color = '214',
        --   name = 'Svg',
        -- },
        -- ['swift'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Swift',
        -- },
        -- ['t'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Tor',
        -- },
        -- ['tbc'] = {
        --   icon = '.',
        --   --icon = '󰛓',
        --   color = '#1e5cb3',
        --   cterm_color = '25',
        --   name = 'Tcl',
        -- },
        -- ['tcl'] = {
        --   icon = '.',
        --   --icon = '󰛓',
        --   color = '#1e5cb3',
        --   cterm_color = '25',
        --   name = 'Tcl',
        -- },
        -- ['terminal'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#31B53E',
        --   cterm_color = '34',
        --   name = 'Terminal',
        -- },
        -- ['tex'] = {
        --   icon = '.',
        --   --icon = '󰙩',
        --   color = '#3D6117',
        --   cterm_color = '22',
        --   name = 'Tex',
        -- },
        -- ['tf'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#5F43E9',
        --   cterm_color = '93',
        --   name = 'Terraform',
        -- },
        -- ['tfvars'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#5F43E9',
        --   cterm_color = '93',
        --   name = 'TFVars',
        -- },
        -- ['toml'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Toml',
        -- },
        -- ['tres'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#cbcb41',
        --   cterm_color = '185',
        --   name = 'TextResource',
        -- },
        -- ['ts'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Ts',
        -- },
        -- ['test.ts'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'TestTs',
        -- },
        -- ['spec.ts'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'SpecTs',
        -- },
        -- ['tscn'] = {
        --   icon = '.',
        --   --icon = '󰎁',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'TextScene',
        -- },
        -- ['tsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#1354bf',
        --   cterm_color = '26',
        --   name = 'Tsx',
        -- },
        -- ['test.tsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#1354bf',
        --   cterm_color = '26',
        --   name = 'TypeScriptReactTest',
        -- },
        -- ['spec.tsx'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#1354bf',
        --   cterm_color = '26',
        --   name = 'TypeScriptReactSpec',
        -- },
        -- ['twig'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#8dc149',
        --   cterm_color = '113',
        --   name = 'Twig',
        -- },
        -- ['txt'] = {
        --   icon = '.',
        --   --icon = '󰈙',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Txt',
        -- },
        -- ['v'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Verilog',
        -- },
        -- ['vala'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#7239b3',
        --   cterm_color = '91',
        --   name = 'Vala',
        -- },
        -- ['vh'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Verilog',
        -- },
        -- ['vhd'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'VHDL',
        -- },
        -- ['vhdl'] = {
        --   icon = '.',
        --   --icon = '󰍛',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'VHDL',
        -- },
        -- ['vim'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#019833',
        --   cterm_color = '28',
        --   name = 'Vim',
        -- },
        -- ['vue'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#8dc149',
        --   cterm_color = '113',
        --   name = 'Vue',
        -- },
        -- ['webmanifest'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f1e05a',
        --   cterm_color = '185',
        --   name = 'Webmanifest',
        -- },
        -- ['webp'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#a074c4',
        --   cterm_color = '140',
        --   name = 'Webp',
        -- },
        -- ['webpack'] = {
        --   icon = '.',
        --   --icon = '󰜫',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Webpack',
        -- },
        -- ['xcplayground'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'XcPlayground',
        -- },
        -- ['xls'] = {
        --   icon = '.',
        --   --icon = '󰈛',
        --   color = '#207245',
        --   cterm_color = '29',
        --   name = 'Xls',
        -- },
        -- ['xlsx'] = {
        --   icon = '.',
        --   --icon = '󰈛',
        --   color = '#207245',
        --   cterm_color = '29',
        --   name = 'Xlsx',
        -- },
        -- ['xml'] = {
        --   icon = '.',
        --   --icon = '󰗀',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Xml',
        -- },
        -- ['xul'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#e37933',
        --   cterm_color = '166',
        --   name = 'Xul',
        -- },
        -- ['yaml'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Yaml',
        -- },
        -- ['yml'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#6d8086',
        --   cterm_color = '66',
        --   name = 'Yml',
        -- },
        -- ['zig'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#f69a1b',
        --   cterm_color = '172',
        --   name = 'Zig',
        -- },
        -- ['zsh'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#89e051',
        --   cterm_color = '113',
        --   name = 'Zsh',
        -- },
        -- ['sol'] = {
        --   icon = '.',
        --   --icon = '󰞻',
        --   color = '#519aba',
        --   cterm_color = '74',
        --   name = 'Solidity',
        -- },
        -- ['prisma'] = {
        --   icon = '.',
        --   --icon = '󰔶',
        --   color = '#ffffff',
        --   cterm_color = '231',
        --   name = 'Prisma',
        -- },
        -- ['lock'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#bbbbbb',
        --   cterm_color = '250',
        --   name = 'Lock',
        -- },
        -- ['log'] = {
        --   icon = '.',
        --   --icon = '󰌱',
        --   color = '#ffffff',
        --   cterm_color = '231',
        --   name = 'Log',
        -- },
        -- ['wasm'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#5c4cdb',
        --   cterm_color = '62',
        --   name = 'Wasm',
        -- },
        -- ['liquid'] = {
        --   icon = '.',
        --   --icon = '',
        --   color = '#95BF47',
        --   cterm_color = '106',
        --   name = 'Liquid',
        -- },
      },
    },
  },

  -- Make it easier to use search functionality
  { 'junegunn/vim-slash', event = 'BufRead' },

  -- Make things PRETTY
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        -- Can be 'left', 'right', or 'center'
        prompt_align = 'center',

        -- These are passed to nvim_open_win
        anchor = 'NW',
        border = 'rounded',

        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        win_options = {
          -- Window transparency (0-100)
          -- This fixes the black background in float windows
          winblend = 0,
        },
      },

      select = {
        -- Options for nui Menu
        nui = { border = { style = 'rounded' } },

        -- Options for built-in selector
        builtin = { border = 'rounded' },
      },
    },
  },

  -- local banned_messages = { 'No information available', 'multiple different client offset_encodings' }
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },

    opts = {
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI

        --- @type table<string, CmdlineFormat>
        format = {
          lua = { pattern = '^:%s*lua=?%s+', icon = '', lang = 'lua' },
          input = {},
        },
      },

      -- You can add any custom commands below that will be available with `:Noice command`
      ---@type table<string, NoiceCommand>
      commands = {},

      lsp = {
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },

        hover = {
          enabled = true,
          opts = { border = 'rounded' },
        },

        signature = {
          enabled = true,
          opts = { border = 'rounded' },
        },
      },

      ---@type NoicePresets
      presets = {
        -- you can enable a preset by setting it to true, or a table that will override the preset config
        -- you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      ---@type NoiceConfigViews
      views = {
        mini = {
          win_options = {
            winblend = 0, -- Make background transparent for nice acrylic finish
          },
        },
      }, ---@see section on views

      ---@type NoiceRouteConfig[]
      routes = {
        {
          filter = {
            any = {
              { find = 'search hit' },
              { find = 'Diagnosing' },
              { find = 'Processing full semantic tokens' },
              { find = 'No information available' },
            },
          },
          opts = { skip = true },
        },

        {
          filter = {
            any = {
              { find = 'Pattern not found' },
              { find = 'cwd:' },
              { find = 'written' },
            },
          },
          view = 'mini',
        },
      }, --- @see section on routes
    },
  },
  -- Zen mode
  {
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    keys = {
      {
        '<leader>zz',
        function()
          require('zen-mode').toggle()
        end,
      },
    },
    dependencies = {
      {
        'folke/twilight.nvim',
        opts = {
          dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { 'Normal', '#ffffff' },
            term_bg = '#000000', -- if guibg=NONE, this will be used to calculate text color
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 10, -- amount of lines we will try to show around the current line
          treesitter = true, -- use treesitter when available for the filetype
        },
      },
    },
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 0.75, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          foldcolumn = '0', -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
      },
    },
  },

  -- Scrollbar
  {
    'petertriho/nvim-scrollbar',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
      max_lines = false, -- disables if no. of lines in buffer exceeds this
      handle = {
        text = ' ',
        color = nil,
        cterm = nil,
        highlight = 'CursorColumn',
        hide_if_all_visible = true, -- Hides handle if all lines are visible
      },
      marks = {
        Search = {
          text = { '-', '=' },
          priority = 0,
          color = nil,
          cterm = nil,
          highlight = 'Search',
        },
        Error = {
          text = { '-', '=' },
          priority = 1,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextError',
        },
        Warn = {
          text = { '-', '=' },
          priority = 2,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextWarn',
        },
        Info = {
          text = { '-', '=' },
          priority = 3,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextInfo',
        },
        Hint = {
          text = { '-', '=' },
          priority = 4,
          color = nil,
          cterm = nil,
          highlight = 'DiagnosticVirtualTextHint',
        },
        Misc = {
          text = { '-', '=' },
          priority = 5,
          color = nil,
          cterm = nil,
          highlight = 'Normal',
        },
      },
      excluded_buftypes = {
        'terminal',
        'NvimTree',
      },
      excluded_filetypes = {
        'prompt',
        'TelescopePrompt',
      },
      autocmd = {
        render = {
          'BufWinEnter',
          'TabEnter',
          'TermEnter',
          'WinEnter',
          'CmdwinLeave',
          'TextChanged',
          'VimResized',
          'WinScrolled',
        },
        clear = {
          'BufWinLeave',
          'TabLeave',
          'TermLeave',
          'WinLeave',
        },
      },
      handlers = {
        diagnostic = true,
        search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
      },
    },
  },

  -- Status and buffer bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = false,
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          -- 'diagnostics',
        },
        lualine_c = { { 'filename', path = 1, file_status = true } },
        lualine_x = {
          'filesize',
          'filetype',
        },
        lualine_y = {
          -- { noice.message.get_hl, cond = noice.message.has },
          -- { noice.command.get_hl, cond = noice.command.has },
          -- { noice.mode.get_hl, cond = noice.mode.has },
          -- { noice.search.get_hl, cond = noice.search.has },
        },
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
      extensions = {},
    },
  },

  -------------------
  -- Tab management
  -------------------
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
      { '<C-t>', '<cmd>tabnew<cr>' }, -- New tab
      { '<Leader>q', '<cmd>bdelete<cr>' }, -- Close the current buffer
      { '<Leader>Q', '<cmd>bdelete!<cr>' }, -- Close the current buffer
      { '<Tab>', vim.cmd.bnext }, -- Next tab
      { '<S-Tab>', vim.cmd.bprev }, -- Previous tab
    },
    cmd = { 'BufferLineCloseLeft', 'BufferLineCloseRight' },
    opts = {
      options = {
        right_mouse_command = nil, -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        diagnostics = 'nvim_lsp',
        indicator = { style = 'none' },
      },
    },
  },
  -- {
  --   'romgrk/barbar.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {},
  --   lazy = false,
  --   keys = {
  --     { '<C-t>', '<cmd>tabnew<cr>' }, -- New tab
  --     { '<Leader>q', '<cmd>BufferClose<cr>' }, -- Close the current buffer
  --     { '<Leader>Q', '<cmd>BufferClose!<cr>' }, -- Close the current buffer
  --     { '<Tab>', '<cmd>BufferNext<cr>' }, -- Next tab
  --     { '<S-Tab>', '<cmd>BufferPrevious<cr>' }, -- Previous tab
  --   },
  -- },

  {
    'utilyre/barbecue.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'smiteshp/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional
    },
    opts = {
      ---whether to attach navic to language servers automatically
      ---@type boolean
      attach_navic = true,

      ---whether to create winbar updater autocmd
      ---@type boolean
      create_autocmd = true,

      ---buftypes to enable winbar in
      ---@type string[]
      include_buftypes = { '' },

      ---filetypes not to enable winbar in
      ---@type string[]
      exclude_filetypes = { 'toggleterm' },

      modifiers = {
        ---filename modifiers applied to dirname
        ---@type string
        dirname = ':~:.',

        ---filename modifiers applied to basename
        ---@type string
        basename = '',
      },

      ---returns a string to be shown at the end of winbar
      ---@type fun(bufnr: number): string
      custom_section = function()
        return ''
      end,

      ---whether to replace file icon with the modified symbol when buffer is modified
      ---@type boolean
      show_modified = false,

      symbols = {
        ---modification indicator
        ---@type string
        modified = '●',

        ---truncation indicator
        ---@type string
        ellipsis = '…',

        ---entry separator
        ---@type string
        separator = '',
      },

      ---icons for different context entry kinds
      ---`false` to disable kind icons
      ---@type table<string, string>|false
      kinds = {
        File = '',
        Package = '',
        Module = '',
        Namespace = '',
        Macro = '',
        Class = '',
        Constructor = '',
        Field = '',
        Property = '',
        Method = '',
        Struct = '',
        Event = '',
        Interface = '',
        Enum = '',
        EnumMember = '',
        Constant = '',
        Function = '',
        TypeParameter = '',
        Variable = '',
        Operator = '',
        Null = '',
        Boolean = '',
        Number = '',
        String = '',
        Key = '',
        Array = '',
        Object = '',
      },
    },
  },
}
