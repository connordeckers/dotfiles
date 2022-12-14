-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/connor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/connor/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/connor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/connor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/connor/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    after = { "nvim-cmp" },
    loaded = true,
    only_config = true
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nÑ\5\0\0\6\0\20\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0166\4\4\0009\4\5\0049\4\6\0049\4\a\0045\5\b\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\t\0045\5\n\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\v\0045\5\f\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\r\0045\5\14\0<\5\4\3=\3\15\0024\3\0\0=\3\16\0024\3\0\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\thide\1\0\2\15extensions\2\rinactive\1\17exclude_name\15exclude_ft\16diagnostics\1\0\1\fenabled\1\tHINT\1\0\1\fenabled\1\tINFO\1\0\1\fenabled\1\tWARN\1\0\2\ticon\bï¬€\fenabled\2\nERROR\rseverity\15diagnostic\bvim\1\0\19\fletters:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\21semantic_letters\2\19maximum_length\3\30\20minimum_padding\3\1\20maximum_padding\3\1\20insert_at_start\1\18insert_at_end\1\16icon_pinned\bï¤‚\28icon_close_tab_modified\bâ—\nicons\2\19icon_close_tab\bï™•\28icon_separator_inactive\bâ–Ž\26icon_separator_active\bâ–Ž\23icon_custom_colors\1\14clickable\2\rclosable\2\rtabpages\2\14auto_hide\1\14animation\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\n\16\0\0\1\0\1\0\2'\0\0\0L\0\2\0\5‰\6\1\0\5\0\23\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\0016\0\16\0009\0\17\0009\0\18\0)\2\0\0'\3\19\0005\4\20\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0)\2\0\0'\3\21\0005\4\22\0B\0\4\1K\0\1\0\1\0\1\tlink\vNormal\22BarbecueSeparator\1\0\1\tlink\vNormal\19NavicSeparator\16nvim_set_hl\bapi\bvim\nkinds\1\0\27\tFile\bî©»\rProperty\bî­¥\nField\bî­Ÿ\vModule\bîª‹\14Namespace\bîª‹\14Interface\bî­¡\tNull\bîªˆ\nClass\bî­›\vObject\bîª‹\rVariable\bîªˆ\fBoolean\bîª\vStruct\bîª‘\fPackage\bîªƒ\rConstant\bî­\15EnumMember\bî­ž\rFunction\bîªŒ\18TypeParameter\bîª’\vMethod\bîªŒ\rOperator\bî­¤\vNumber\bîª\nEvent\bîª†\vString\bîª“\bKey\bî¬‘\nArray\bîªŠ\nMacro\bî­¢\16Constructor\bî­›\tEnum\bîª•\fsymbols\1\0\3\rellipsis\bâ€¦\rmodified\bâ—\14separator\bîª¶\19custom_section\0\14modifiers\1\0\2\fdirname\t:~:.\rbasename\5\22exclude_filetypes\1\2\0\0\15toggleterm\21include_buftypes\1\2\0\0\5\1\0\3\19create_autocmd\2\17attach_navic\2\18show_modified\1\nsetup\rbarbecue\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["chezmoi.vim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/chezmoi.vim",
    url = "https://github.com/alker0/chezmoi.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["comment.nvim"] = {
    config = { "\27LJ\2\nÓ\1\0\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3B\3\1\2=\3\b\2B\0\2\1K\0\1\0\rpre_hook\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\rmappings\1\0\2\nextra\1\nbasic\1\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/comment.nvim",
    url = "https://github.com/numtostr/comment.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0û\6\1\0\a\0'\0/6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\f\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0043\5\n\0=\5\v\4=\4\r\0035\4\14\0005\5\15\0=\5\16\0045\5\18\0005\6\17\0=\6\19\5=\5\20\0045\5\22\0005\6\21\0=\6\23\5=\5\24\0045\5\25\0005\6\26\0=\6\27\5=\5\28\0045\5\29\0005\6\30\0=\6\t\0055\6\31\0=\6\5\0055\6 \0=\6\a\0055\6!\0=\6\"\0053\6#\0=\6\v\5=\5$\0044\5\0\0=\5%\4=\4&\3B\1\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\15min_height\1\3\0\0\3\n\4š³æÌ\t™³¦þ\3\1\3\0\0\3(\4š³æÌ\t™³¦þ\3\1\3\0\0\3Œ\1\4š³æÌ\t™³¦ÿ\3\1\0\2\rwinblend\3\n\17winhighlight\5\1\0\4\rrelative\vcursor\vanchor\aNW\vborder\frounded\15max_height\4Í™³æ\fÌ™³ÿ\3\bnui\vborder\1\0\1\nstyle\frounded\1\0\4\14max_width\3P\rposition\b50%\rrelative\vcursor\15max_height\3(\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\1\fenabled\2\ninput\1\0\0\roverride\0\16win_options\1\0\2\rwinblend\3\n\17winhighlight\5\14min_width\1\3\0\0\3\20\4š³æÌ\t™³¦þ\3\14max_width\1\3\0\0\3Œ\1\4Í™³æ\fÌ™³ÿ\3\1\0\b\17prefer_width\3(\16insert_only\2\vborder\frounded\17prompt_align\tleft\fenabled\2\vanchor\aNW\19default_prompt\vInput:\rrelative\vcursor\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÜ\3\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\rrelative\vcursor\brow\3\0\bcol\3\1&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\3\ndelay\3è\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\1\0\t\24attach_to_untracked\2\20update_debounce\3–\1\20max_file_length\3À¸\2\14word_diff\1\vlinehl\1\nnumhl\2\18sign_priority\3\6\15signcolumn\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\næ\3\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\24extra_trigger_chars\1\5\0\0\6(\6,\6{\6[\17handler_opts\1\0\1\vborder\frounded\1\0\20\fpadding\5\vzindex\3È\1\tbind\2\19always_trigger\1\14max_width\3P\15max_height\3\f\17hi_parameter LspSignatureActiveParameter\16hint_scheme\vString\16hint_enable\2\ffix_pos\1\26floating_window_off_y\3\1\26floating_window_off_x\3\1#floating_window_above_cur_line\2\20floating_window\1\14doc_lines\3\n\15toggle_key\n<C-x>\19timer_interval\3È\1\17shadow_guibg\nBlack\17shadow_blend\3$\17transparency\3\25\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\ná\5\0\0\a\0!\00036\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0044\5\3\0005\6\17\0>\6\1\5=\5\18\0045\5\19\0=\5\20\0044\5\0\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0004\5\0\0=\5\14\0044\5\0\0=\5\16\0045\5\26\0=\5\18\0045\5\27\0=\5\20\0044\5\0\0=\5\21\0044\5\0\0=\5\23\4=\4\28\0034\4\0\0=\4\29\3B\1\2\0016\1\30\0009\1\31\1'\3 \0B\1\2\1K\0\1\0F\t\t\t\tset guioptions-=e\n\t\t\t\tset sessionoptions+=tabpages,globals\n\t\t\bcmd\bvim\15extensions\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\14lualine_x\1\3\0\0\rfilesize\rfiletype\14lualine_c\1\2\2\0\rfilename\tpath\3\1\16file_status\2\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\ntheme\fonedark\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-runner.nvim"] = {
    commands = { "NeoRunner" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/neo-runner.nvim",
    url = "https://github.com/BenGH28/neo-runner.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n°\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15typescript\1\2\0\0\20template_string\15javascript\1\0\0\1\2\0\0\20template_string\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandå\1\0\0\4\0\v\0\0286\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0029\1\5\1\a\1\6\0X\1\3€+\1\2\0L\1\2\0X\1\14€9\1\a\0'\3\b\0B\1\2\2\14\0\1\0X\1\5€9\1\t\0'\3\n\0B\1\2\2\19\1\1\0X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0K\0\1\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\6c\tmode\18nvim_get_mode\bapi\bvim\23cmp.config.context\frequire/\0\2\4\1\2\0\a9\2\1\1=\2\0\1-\2\0\0009\3\1\0018\2\3\2=\2\1\1L\1\2\0\5À\tkind\tmenuÓ\1\0\1\4\3\6\0\30-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\20€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\v€-\1\2\0B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\4\0015\3\5\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\4À\1\0\1\vselect\2\fconfirm\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÓ\f\1\0\16\0U\0’\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0026\3\0\0'\5\5\0B\3\2\0029\3\1\0039\3\6\0033\4\a\0006\5\b\0009\5\t\5'\6\v\0=\6\n\0055\5\f\0009\6\r\0005\b\17\0005\t\15\0003\n\14\0=\n\16\t=\t\18\b3\t\19\0=\t\20\b5\t\21\0004\n\3\0009\v\22\3>\v\1\n9\v\23\3>\v\2\n=\n\24\t=\t\25\b5\t\27\0005\n\26\0=\n\28\t3\n\29\0=\n\30\t=\t\31\b9\t \0009\t!\t9\t\"\t5\v$\0009\f \0009\f#\f)\14üÿB\f\2\2=\f%\v9\f \0009\f#\f)\14\4\0B\f\2\2=\f&\v9\f \0009\f'\fB\f\1\2=\f(\v9\f \0009\f)\fB\f\1\2=\f*\v9\f \0009\f+\f5\14.\0009\15,\0009\15-\15=\15/\14B\f\2\2=\f0\v9\f \0003\0141\0005\0152\0B\f\3\2=\f3\v9\f \0003\0144\0005\0155\0B\f\3\2=\f6\vB\t\2\2=\t \b5\t>\0004\n\b\0009\v7\2>\v\1\n9\v8\2>\v\2\n9\v9\2>\v\3\n9\v:\2>\v\4\n9\v;\2>\v\5\n9\v<\2>\v\6\n9\v=\2>\v\a\n=\n?\t=\t@\b9\t\3\0009\tA\t4\v\4\0005\fB\0>\f\1\v5\fC\0>\f\2\v5\fD\0>\f\3\vB\t\2\2=\tA\b9\tE\0009\tF\t=\tG\bB\6\2\0016\6\0\0'\bH\0B\6\2\0029\aI\0\18\t\a\0009\aJ\a'\nK\0009\vL\0065\rN\0005\14M\0=\14O\rB\v\2\0A\a\2\0019\a\r\0009\aP\a'\tQ\0005\nT\0009\v\3\0009\vA\v4\r\3\0005\14R\0>\14\1\r4\14\3\0005\15S\0>\15\1\14B\v\3\2=\vA\nB\a\3\0012\0\0€K\0\1\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\14preselect\tItem\18PreselectMode\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nscore\nexact\voffset\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-d>\n<C-f>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\15completion\17autocomplete\16TextChanged\16InsertEnter\1\0\1\19keyword_length\3\1\fenabled\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\25\tUnit\bï¥¬\rProperty\bï° \nField\bï° \vModule\bï£’\16Constructor\bâŒ˜\14Interface\bïƒ¨\tFile\bïœ˜\nClass\bï´¯\rOperator\bïš”\rVariable\bïœ›\18TypeParameter\5\vStruct\bï­„\rConstant\bï£¿\15EnumMember\bï…\rFunction\bïž”\vFolder\bï»\vMethod\bïš¦\14Reference\bïœ†\tText\bïƒ‰\nEvent\bïƒ§\nColor\bï£—\fSnippet\bï™°\fKeyword\bï¨‹\tEnum\bï…\nValue\bï¢Ÿ\26menu,menuone,noselect\16completeopt\6o\bvim\0\17TriggerEvent\14cmp.types\fcompare\vconfig\fluasnip\bcmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-custom-diagnostic-highlight"] = {
    config = { "\27LJ\2\nù\1\0\0\6\0\a\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0004\5\0\0=\5\5\4=\1\6\4B\2\2\1K\0\1\0!diagnostic_handler_namespace\19extra_patterns\1\0\3\21register_handler\2\20highlight_group\16UnusedToken\17handler_name\25patch/diagnostics-hl\nsetup\20patch.hl-groups%nvim-custom-diagnostic-highlight\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-custom-diagnostic-highlight",
    url = "https://github.com/Kasama/nvim-custom-diagnostic-highlight"
  },
  ["nvim-dap"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nN\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\18format_buffer\23patch.utils.format\frequire¹\6\1\2\14\2%\0\\5\2\0\0=\1\1\0026\3\2\0006\5\3\0009\5\4\0059\5\5\5B\3\2\4H\6\b€6\b\6\0009\b\a\b9\b\b\b'\n\t\0\18\v\6\0\18\f\a\0\18\r\2\0B\b\5\1F\6\3\3R\6ö\1276\3\n\0006\5\v\0'\6\f\0B\3\3\3\15\0\3\0X\5\b€9\5\r\0009\5\14\5\15\0\5\0X\6\4€9\5\15\4\18\a\0\0\18\b\1\0B\5\3\0016\5\3\0009\5\16\5\15\0\5\0X\6\25€9\5\17\0'\a\18\0B\5\2\2\15\0\5\0X\6\20€6\5\6\0009\5\19\0059\5\20\0055\a\21\0005\b\23\0-\t\0\0009\t\22\t=\t\24\b=\1\1\bB\5\3\0016\5\6\0009\5\19\0059\5\20\0055\a\25\0005\b\27\0-\t\0\0009\t\26\t=\t\24\b=\1\1\bB\5\3\0016\5\3\0009\5\28\0059\5\29\5\15\0\5\0X\6\24€9\5\17\0'\a\30\0B\5\2\2\15\0\5\0X\6\19€6\5\6\0009\5\19\0059\5\31\0055\a \0-\b\1\0=\b!\a=\1\1\aB\5\2\0016\5\6\0009\5\19\0059\5\20\5'\a\"\0005\b#\0-\t\1\0=\t!\b=\1\1\b3\t$\0=\t\24\bB\5\3\0012\0\0€K\0\1\0\aÀ\tÀ\0\1\0\0\16BufWritePre\ngroup\1\0\0\24nvim_clear_autocmds\28textDocument/formatting\19format_on_save\15formatting\1\0\0\21clear_references\1\3\0\0\16CursorMoved\17CursorMovedI\rcallback\1\0\0\23document_highlight\1\3\0\0\15CursorHold\16CursorHoldI\24nvim_create_autocmd\bapi#textDocument/documentHighlight\20supports_method\30highlightTokenUnderCursor\vattach\27documentSymbolProvider\24server_capabilities\15nvim-navic\frequire\npcall\6n\bset\vkeymap\bvim\fkeymaps\blsp\14LSPConfig\npairs\vbuffer\1\0\2\fnoremap\2\vsilent\2*\0\2\3\0\2\0\3'\2\1\0=\2\0\0K\0\1\0\vutf-32\20offset_encodingà\n\1\0\28\0A\0²\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\b\0009\a\t\a9\a\n\a4\b\r\0006\t\0\0'\v\v\0B\t\2\2>\t\1\b9\t\f\0019\t\r\t9\t\14\t>\t\2\b9\t\f\0019\t\15\t9\t\16\t>\t\3\b9\t\f\0019\t\15\t9\t\17\t>\t\4\b9\t\f\0019\t\15\t9\t\18\t>\t\5\b9\t\f\0019\t\15\t9\t\19\t>\t\6\b9\t\f\0019\t\15\t9\t\20\t>\t\a\b9\t\f\0019\t\15\t9\t\21\t>\t\b\b9\t\f\0019\t\22\t9\t\23\t>\t\t\b9\t\f\0019\t\24\t9\t\25\t9\t\26\t5\v\29\0006\f\27\0009\f\28\f=\f\30\vB\t\2\2>\t\n\b9\t\f\0019\t\24\t9\t\31\t>\t\v\b9\t\f\0019\t\24\t9\t \t>\t\f\b6\t\b\0009\t!\t9\t\"\t'\v#\0004\f\0\0B\t\3\0023\n$\0005\v)\0006\f\b\0009\f\t\f9\f\26\f6\14\b\0009\14\t\0149\14%\0149\14&\0146\15\27\0009\15'\0159\15(\15B\f\3\2=\f*\v9\f+\0066\14\b\0009\14\t\0149\14,\0149\14-\14B\14\1\0A\f\0\0025\r.\0=\n/\r=\f0\r=\v%\r9\0141\0056\16\b\0009\0162\16'\0183\0006\19\27\0009\0194\0195\0205\0=\r6\20B\16\4\0A\14\0\0019\0141\0026\16\27\0009\16\3\0169\0167\16B\14\2\0019\0141\0036\16\27\0009\16\3\0169\0168\16B\14\2\0019\0141\0046\16\27\0009\16\3\0169\0169\16B\14\2\0019\0141\0015\16:\0=\b;\0163\17<\0=\17=\16B\14\2\0014\14\0\0006\15>\0006\17\27\0009\17\t\0179\17?\17B\15\2\4H\18\2€4\20\0\0<\20\19\14F\18\3\3R\18ü\1276\15\b\0009\0152\15'\0173\0004\18\0\0\18\19\14\0006\20\27\0009\20\t\0209\20@\20B\15\5\0026\16>\0\18\18\15\0B\16\2\4H\19\t€8\21\19\0009\0211\0216\23\b\0009\0232\23'\0253\0\18\26\r\0\18\27\20\0B\23\4\0A\21\0\1F\19\3\3R\19õ\1272\0\0€K\0\1\0\rextended\fdefault\npairs\fon_init\0\fsources\1\0\0\19null_ls_config\19lspconf_config\vconfig\vserver\1\0\0\21typescript_setup\nforce\20tbl_deep_extend\nsetup\17capabilities\14on_attach\1\0\0\29make_client_capabilities\rprotocol\25default_capabilities\23textDocument/hover\1\0\0\23hover_float_config\aui\nhover\rhandlers\0\18LspFormatting\24nvim_create_augroup\bapi\17clang_format\vstylua\14filetypes\1\0\1\ftimeout\3ˆ'\23prettier_filetypes\14LSPConfig\twith\rprettier\15formatting\ttags\15completion\rhadolint\fgitlint\fcpplint\15commitlint\14codespell\15cmake_lint\16diagnostics\rgitsigns\17code_actions\rbuiltins\"patch.code-actions.typescript\bbuf\blsp\bvim\17cmp_nvim_lsp\15typescript\18mason-null-ls\20mason-lspconfig\nmason\fnull-ls\14lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n„\1\2\1\n\2\4\0\0246\1\0\0-\3\0\0B\1\2\4X\4\r€6\6\1\0\18\b\0\0B\6\2\2\a\6\2\0X\6\b€6\6\2\0009\6\3\6\18\b\0\0\18\t\5\0B\6\3\2\15\0\6\0X\a\1€K\0\1\0E\4\3\3R\4ñ\127-\1\1\0\18\3\0\0G\4\1\0A\1\1\1K\0\1\0\0À\1À\nmatch\vstring\ttype\vipairs¢\1\1\0\5\0\6\0\f5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0014\4\0\0B\2\2\0016\2\4\0003\3\5\0=\3\2\0022\0\0€K\0\1\0\0\bvim\nsetup\vnotify\frequire\1\3\0\0\29No information available8warning: multiple different client offset_encodings\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\nÕ\a\0\0\6\0'\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\0035\4\f\0005\5\v\0=\5\b\4=\4\r\0035\4\15\0005\5\14\0=\5\b\4=\4\16\0035\4\18\0005\5\17\0=\5\b\4=\4\19\0035\4\21\0005\5\20\0=\5\b\4=\4\22\0035\4\24\0005\5\23\0=\5\b\4=\4\25\3=\3\26\0025\3\27\0=\3\28\0025\3\29\0=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0=\3&\2B\0\2\1K\0\1\0\rhandlers\1\0\2\vsearch\1\15diagnostic\2\fautocmd\nclear\1\5\0\0\16BufWinLeave\rTabLeave\14TermLeave\rWinLeave\vrender\1\0\0\1\t\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\15VimResized\16WinScrolled\23excluded_filetypes\1\3\0\0\vprompt\20TelescopePrompt\22excluded_buftypes\1\3\0\0\rterminal\rNvimTree\nmarks\tMisc\1\0\2\14highlight\vNormal\rpriority\3\5\1\3\0\0\6-\6=\tHint\1\0\2\14highlight\30DiagnosticVirtualTextHint\rpriority\3\4\1\3\0\0\6-\6=\tInfo\1\0\2\14highlight\30DiagnosticVirtualTextInfo\rpriority\3\3\1\3\0\0\6-\6=\tWarn\1\0\2\14highlight\30DiagnosticVirtualTextWarn\rpriority\3\2\1\3\0\0\6-\6=\nError\1\0\2\14highlight\31DiagnosticVirtualTextError\rpriority\3\1\1\3\0\0\6-\6=\vSearch\1\0\0\ttext\1\0\2\14highlight\vSearch\rpriority\3\0\1\3\0\0\6-\6=\vhandle\1\0\3\ttext\6 \24hide_if_all_visible\2\14highlight\17CursorColumn\1\0\5\24show_in_active_only\1\tshow\2\14max_lines\1\nfolds\3è\a\19set_highlights\2\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nå\5\0\0\t\0&\0.6\0\0\0009\0\1\0009\0\2\0006\1\3\0'\3\4\0B\1\2\0029\2\5\0015\4\6\0005\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0005\6\r\0009\a\f\0=\a\14\0069\a\15\0=\a\16\6=\6\2\5=\5\17\0045\5\18\0=\5\19\0045\5\20\0005\6\21\0=\6\22\0055\6\26\0004\a\4\0005\b\23\0>\b\1\a5\b\24\0>\b\2\a5\b\25\0>\b\3\a=\a\27\6=\6\28\5=\5\29\0045\5\30\0005\6\31\0=\6 \5=\5!\0045\5#\0005\6\"\0=\6$\5=\5%\4B\2\2\1K\0\1\0\btab\tsync\1\0\0\1\0\2\nclose\2\topen\2\rrenderer\19indent_markers\1\0\1\venable\2\1\0\3\16group_empty\2\17add_trailing\2\27highlight_opened_files\ball\tview\rmappings\tlist\1\0\0\1\0\2\bkey\6L\vaction\acd\1\0\2\bkey\6h\vaction\15close_node\1\0\2\bkey\6l\vaction\tedit\nfloat\1\0\1\venable\1\1\0\1\18adaptive_size\2\ffilters\1\0\1\rdotfiles\2\16diagnostics\bmax\nERROR\bmin\1\0\0\tWARN\1\0\2\venable\2\17show_on_dirs\2\24update_focused_file\1\0\2\16update_root\2\venable\2\23hijack_directories\1\0\1\venable\2\1\0\6\23sync_root_with_cwd\2\18hijack_cursor\2\19select_prompts\2\fsort_by\14extension\18open_on_setup\1\20respect_buf_cwd\2\nsetup\14nvim-tree\frequire\rseverity\15diagnostic\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nñ\a\0\0\6\0\"\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\18\0005\4\16\0005\5\17\0=\5\f\4=\4\19\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0005\5\27\0=\5\f\4=\4\28\3=\3\29\0025\3\30\0=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15playground\1\0\2\venable\2\15updatetime\3\25\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\rrefactor\15navigation\1\0\5\20goto_definition\bgnd\24goto_previous_usage\n<a-#>\20goto_next_usage\n<a-*>\25list_definitions_toc\agO\21list_definitions\bgnD\1\0\1\venable\2\17smart_rename\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\2\25clear_on_cursor_move\2\venable\2\16textobjects\vselect\1\0\0\1\0\b\aap\19@json.property\aaS\22@tag.self-closing\aic\17@class.inner\aiC\23@conditional.inner\aaf\20@function.outer\aac\17@class.outer\aaC\23@conditional.outer\aif\20@function.inner\1\0\2\venable\2\14lookahead\2\npairs\20delete_balanced\1\0\2\23only_on_first_char\1\20longest_partner\1\fkeymaps\1\0\2\17goto_partner\14<leader>%\20delete_balanced\6X\26highlight_pair_events\fdisable\1\0\4\19highlight_self\1\venable\2\24fallback_cmd_normal)call matchit#Match_wrapper('',1,'n')\19goto_right_end\1\14highlight\1\0\1\venable\2\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["ssr.nvim"] = {
    config = { "\27LJ\2\nŸ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\4\nclose\6q\15next_match\6n\16replace_all\17<leader><cr>\15prev_match\6N\1\0\2\15min_height\3\5\14min_width\0032\nsetup\bssr\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/ssr.nvim",
    url = "https://github.com/cshuaimin/ssr.nvim"
  },
  ["swap-buffers.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/swap-buffers.nvim",
    url = "https://github.com/caenrique/swap-buffers.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nn\0\2\a\4\2\1\16\14\0\1\0X\2\1€K\0\1\0009\2\0\1*\3\0\0\1\3\2\0X\2\2€K\0\1\0X\2\6€-\2\0\0009\2\1\2-\4\1\0-\5\2\0-\6\3\0B\2\4\1K\0\1\0\0\0\0€\1À\2€\27buffer_previewer_maker\tsizeÀš\fi\1\3\a\1\6\0\17\14\0\2\0X\3\1€4\2\0\0006\3\0\0009\3\1\0039\3\2\3\18\5\0\0B\3\2\2\18\0\3\0006\3\0\0009\3\3\0039\3\4\3\18\5\0\0003\6\5\0B\3\3\0012\0\0€K\0\1\0\1À\0\ffs_stat\tloop\vexpand\afn\bvimß\2\1\0\t\0\22\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\v\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\6=\2\n\6=\6\f\0055\6\16\0005\a\14\0005\b\r\0=\b\15\a=\a\17\6=\6\18\0054\6\0\0=\6\19\5B\3\2\0019\3\20\0'\5\21\0B\3\2\0012\0\0€K\0\1\0\fluasnip\19load_extension\15extensions\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\rdefaults\1\0\0\27buffer_previewer_maker\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\0\25telescope.previewers\14telescope\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux-navigator.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\fenabled\2\19DisableMapping\2\nsetup\19tmux-navigator\frequire\0" },
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/tmux-navigator.nvim",
    url = "https://github.com/connordeckers/tmux-navigator.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\né\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\14\tmode\25document_diagnostics\rposition\nright\17auto_preview\2\15auto_close\1\14auto_open\1\17indent_lines\2\fpadding\2\16fold_closed\bï‘ \ngroup\2\14fold_open\bï‘¼\14auto_fold\1\vheight\3\n\nwidth\0032\nicons\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-caddyfile"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-caddyfile",
    url = "https://github.com/isobit/vim-caddyfile"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-obsession"] = {
    commands = { "Obsess" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-slash"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-slash",
    url = "https://github.com/junegunn/vim-slash"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/connor/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\nÏ\1\0\0\5\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\3=\3\b\2D\0\2\0\17filter_rules\fbufname\fbuftype\rfiletype\1\0\2\fcur_win\2\vfloats\2\1\0\1\17picker_chars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\16pick_window\17winshift.lib\frequireÅ\3\1\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\18window_picker\0\fkeymaps\18win_move_mode\1\0\16\r<S-left>\rfar_left\6h\tleft\t<up>\aup\v<down>\tdown\v<left>\tleft\6j\tdown\6L\14far_right\f<right>\nright\6K\vfar_up\6J\rfar_down\6k\aup\6H\rfar_left\14<S-right>\14far_right\6l\nright\v<S-up>\vfar_up\r<S-down>\rfar_down\1\0\1\21disable_defaults\1\23moving_win_options\1\0\4\15cursorline\1\17cursorcolumn\1\16colorcolumn\5\twrap\1\1\0\2\25highlight_moving_win\2\21focused_hl_group\vVisual\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/connor/.local/share/nvim/site/pack/packer/opt/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nvim%-tree"] = "nvim-tree.lua",
  ["^ssr"] = "ssr.nvim",
  ["^swap_buffers"] = "swap-buffers.nvim",
  ["^telescope%._extensions%.luasnip"] = "telescope-luasnip.nvim",
  ["^trouble"] = "trouble.nvim",
  ["^winshift"] = "winshift.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÜ\3\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\rrelative\vcursor\brow\3\0\bcol\3\1&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\3\ndelay\3è\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3è\a\17follow_files\2\fkeymaps\1\0\t\24attach_to_untracked\2\20update_debounce\3–\1\20max_file_length\3À¸\2\14word_diff\1\vlinehl\1\nnumhl\2\18sign_priority\3\6\15signcolumn\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nÑ\5\0\0\6\0\20\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0166\4\4\0009\4\5\0049\4\6\0049\4\a\0045\5\b\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\t\0045\5\n\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\v\0045\5\f\0<\5\4\0036\4\4\0009\4\5\0049\4\6\0049\4\r\0045\5\14\0<\5\4\3=\3\15\0024\3\0\0=\3\16\0024\3\0\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\thide\1\0\2\15extensions\2\rinactive\1\17exclude_name\15exclude_ft\16diagnostics\1\0\1\fenabled\1\tHINT\1\0\1\fenabled\1\tINFO\1\0\1\fenabled\1\tWARN\1\0\2\ticon\bï¬€\fenabled\2\nERROR\rseverity\15diagnostic\bvim\1\0\19\fletters:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\21semantic_letters\2\19maximum_length\3\30\20minimum_padding\3\1\20maximum_padding\3\1\20insert_at_start\1\18insert_at_end\1\16icon_pinned\bï¤‚\28icon_close_tab_modified\bâ—\nicons\2\19icon_close_tab\bï™•\28icon_separator_inactive\bâ–Ž\26icon_separator_active\bâ–Ž\23icon_custom_colors\1\14clickable\2\rclosable\2\rtabpages\2\14auto_hide\1\14animation\2\nsetup\15bufferline\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: barbecue.nvim
time([[Config for barbecue.nvim]], true)
try_loadstring("\27LJ\2\n\16\0\0\1\0\1\0\2'\0\0\0L\0\2\0\5‰\6\1\0\5\0\23\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\0016\0\16\0009\0\17\0009\0\18\0)\2\0\0'\3\19\0005\4\20\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0)\2\0\0'\3\21\0005\4\22\0B\0\4\1K\0\1\0\1\0\1\tlink\vNormal\22BarbecueSeparator\1\0\1\tlink\vNormal\19NavicSeparator\16nvim_set_hl\bapi\bvim\nkinds\1\0\27\tFile\bî©»\rProperty\bî­¥\nField\bî­Ÿ\vModule\bîª‹\14Namespace\bîª‹\14Interface\bî­¡\tNull\bîªˆ\nClass\bî­›\vObject\bîª‹\rVariable\bîªˆ\fBoolean\bîª\vStruct\bîª‘\fPackage\bîªƒ\rConstant\bî­\15EnumMember\bî­ž\rFunction\bîªŒ\18TypeParameter\bîª’\vMethod\bîªŒ\rOperator\bî­¤\vNumber\bîª\nEvent\bîª†\vString\bîª“\bKey\bî¬‘\nArray\bîªŠ\nMacro\bî­¢\16Constructor\bî­›\tEnum\bîª•\fsymbols\1\0\3\rellipsis\bâ€¦\rmodified\bâ—\14separator\bîª¶\19custom_section\0\14modifiers\1\0\2\fdirname\t:~:.\rbasename\5\22exclude_filetypes\1\2\0\0\15toggleterm\21include_buftypes\1\2\0\0\5\1\0\3\19create_autocmd\2\17attach_navic\2\18show_modified\1\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")
time([[Config for barbecue.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nn\0\2\a\4\2\1\16\14\0\1\0X\2\1€K\0\1\0009\2\0\1*\3\0\0\1\3\2\0X\2\2€K\0\1\0X\2\6€-\2\0\0009\2\1\2-\4\1\0-\5\2\0-\6\3\0B\2\4\1K\0\1\0\0\0\0€\1À\2€\27buffer_previewer_maker\tsizeÀš\fi\1\3\a\1\6\0\17\14\0\2\0X\3\1€4\2\0\0006\3\0\0009\3\1\0039\3\2\3\18\5\0\0B\3\2\2\18\0\3\0006\3\0\0009\3\3\0039\3\4\3\18\5\0\0003\6\5\0B\3\3\0012\0\0€K\0\1\0\1À\0\ffs_stat\tloop\vexpand\afn\bvimß\2\1\0\t\0\22\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\v\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\6=\2\n\6=\6\f\0055\6\16\0005\a\14\0005\b\r\0=\b\15\a=\a\17\6=\6\18\0054\6\0\0=\6\19\5B\3\2\0019\3\20\0'\5\21\0B\3\2\0012\0\0€K\0\1\0\fluasnip\19load_extension\15extensions\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\rdefaults\1\0\0\27buffer_previewer_maker\rmappings\1\0\0\6i\1\0\0\1\0\1\n<C-h>\14which_key\nsetup\0\25telescope.previewers\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\næ\3\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\24extra_trigger_chars\1\5\0\0\6(\6,\6{\6[\17handler_opts\1\0\1\vborder\frounded\1\0\20\fpadding\5\vzindex\3È\1\tbind\2\19always_trigger\1\14max_width\3P\15max_height\3\f\17hi_parameter LspSignatureActiveParameter\16hint_scheme\vString\16hint_enable\2\ffix_pos\1\26floating_window_off_y\3\1\26floating_window_off_x\3\1#floating_window_above_cur_line\2\20floating_window\1\14doc_lines\3\n\15toggle_key\n<C-x>\19timer_interval\3È\1\17shadow_guibg\nBlack\17shadow_blend\3$\17transparency\3\25\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n„\1\2\1\n\2\4\0\0246\1\0\0-\3\0\0B\1\2\4X\4\r€6\6\1\0\18\b\0\0B\6\2\2\a\6\2\0X\6\b€6\6\2\0009\6\3\6\18\b\0\0\18\t\5\0B\6\3\2\15\0\6\0X\a\1€K\0\1\0E\4\3\3R\4ñ\127-\1\1\0\18\3\0\0G\4\1\0A\1\1\1K\0\1\0\0À\1À\nmatch\vstring\ttype\vipairs¢\1\1\0\5\0\6\0\f5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0014\4\0\0B\2\2\0016\2\4\0003\3\5\0=\3\2\0022\0\0€K\0\1\0\0\bvim\nsetup\vnotify\frequire\1\3\0\0\29No information available8warning: multiple different client offset_encodings\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\ná\5\0\0\a\0!\00036\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0044\5\3\0005\6\17\0>\6\1\5=\5\18\0045\5\19\0=\5\20\0044\5\0\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0004\5\0\0=\5\14\0044\5\0\0=\5\16\0045\5\26\0=\5\18\0045\5\27\0=\5\20\0044\5\0\0=\5\21\0044\5\0\0=\5\23\4=\4\28\0034\4\0\0=\4\29\3B\1\2\0016\1\30\0009\1\31\1'\3 \0B\1\2\1K\0\1\0F\t\t\t\tset guioptions-=e\n\t\t\t\tset sessionoptions+=tabpages,globals\n\t\t\bcmd\bvim\15extensions\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\14lualine_x\1\3\0\0\rfilesize\rfiletype\14lualine_c\1\2\2\0\rfilename\tpath\3\1\16file_status\2\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\4\ntheme\fonedark\18icons_enabled\2\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\nÕ\a\0\0\6\0'\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\0035\4\f\0005\5\v\0=\5\b\4=\4\r\0035\4\15\0005\5\14\0=\5\b\4=\4\16\0035\4\18\0005\5\17\0=\5\b\4=\4\19\0035\4\21\0005\5\20\0=\5\b\4=\4\22\0035\4\24\0005\5\23\0=\5\b\4=\4\25\3=\3\26\0025\3\27\0=\3\28\0025\3\29\0=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\3=\3$\0025\3%\0=\3&\2B\0\2\1K\0\1\0\rhandlers\1\0\2\vsearch\1\15diagnostic\2\fautocmd\nclear\1\5\0\0\16BufWinLeave\rTabLeave\14TermLeave\rWinLeave\vrender\1\0\0\1\t\0\0\16BufWinEnter\rTabEnter\14TermEnter\rWinEnter\16CmdwinLeave\16TextChanged\15VimResized\16WinScrolled\23excluded_filetypes\1\3\0\0\vprompt\20TelescopePrompt\22excluded_buftypes\1\3\0\0\rterminal\rNvimTree\nmarks\tMisc\1\0\2\14highlight\vNormal\rpriority\3\5\1\3\0\0\6-\6=\tHint\1\0\2\14highlight\30DiagnosticVirtualTextHint\rpriority\3\4\1\3\0\0\6-\6=\tInfo\1\0\2\14highlight\30DiagnosticVirtualTextInfo\rpriority\3\3\1\3\0\0\6-\6=\tWarn\1\0\2\14highlight\30DiagnosticVirtualTextWarn\rpriority\3\2\1\3\0\0\6-\6=\nError\1\0\2\14highlight\31DiagnosticVirtualTextError\rpriority\3\1\1\3\0\0\6-\6=\vSearch\1\0\0\ttext\1\0\2\14highlight\vSearch\rpriority\3\0\1\3\0\0\6-\6=\vhandle\1\0\3\ttext\6 \24hide_if_all_visible\2\14highlight\17CursorColumn\1\0\5\24show_in_active_only\1\tshow\2\14max_lines\1\nfolds\3è\a\19set_highlights\2\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: comment.nvim
time([[Config for comment.nvim]], true)
try_loadstring("\27LJ\2\nÓ\1\0\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3B\3\1\2=\3\b\2B\0\2\1K\0\1\0\rpre_hook\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\rmappings\1\0\2\nextra\1\nbasic\1\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0", "config", "comment.nvim")
time([[Config for comment.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nñ\a\0\0\6\0\"\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0034\4\0\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\0025\3\18\0005\4\16\0005\5\17\0=\5\f\4=\4\19\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0005\5\27\0=\5\f\4=\4\28\3=\3\29\0025\3\30\0=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\15playground\1\0\2\venable\2\15updatetime\3\25\26context_commentstring\1\0\2\19enable_autocmd\1\venable\2\rrefactor\15navigation\1\0\5\20goto_definition\bgnd\24goto_previous_usage\n<a-#>\20goto_next_usage\n<a-*>\25list_definitions_toc\agO\21list_definitions\bgnD\1\0\1\venable\2\17smart_rename\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\2\25clear_on_cursor_move\2\venable\2\16textobjects\vselect\1\0\0\1\0\b\aap\19@json.property\aaS\22@tag.self-closing\aic\17@class.inner\aiC\23@conditional.inner\aaf\20@function.outer\aac\17@class.outer\aaC\23@conditional.outer\aif\20@function.inner\1\0\2\venable\2\14lookahead\2\npairs\20delete_balanced\1\0\2\23only_on_first_char\1\20longest_partner\1\fkeymaps\1\0\2\17goto_partner\14<leader>%\20delete_balanced\6X\26highlight_pair_events\fdisable\1\0\4\19highlight_self\1\venable\2\24fallback_cmd_normal)call matchit#Match_wrapper('',1,'n')\19goto_right_end\1\14highlight\1\0\1\venable\2\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-custom-diagnostic-highlight
time([[Config for nvim-custom-diagnostic-highlight]], true)
try_loadstring("\27LJ\2\nù\1\0\0\6\0\a\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0004\5\0\0=\5\5\4=\1\6\4B\2\2\1K\0\1\0!diagnostic_handler_namespace\19extra_patterns\1\0\3\21register_handler\2\20highlight_group\16UnusedToken\17handler_name\25patch/diagnostics-hl\nsetup\20patch.hl-groups%nvim-custom-diagnostic-highlight\frequire\0", "config", "nvim-custom-diagnostic-highlight")
time([[Config for nvim-custom-diagnostic-highlight]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0û\6\1\0\a\0'\0/6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\f\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0043\5\n\0=\5\v\4=\4\r\0035\4\14\0005\5\15\0=\5\16\0045\5\18\0005\6\17\0=\6\19\5=\5\20\0045\5\22\0005\6\21\0=\6\23\5=\5\24\0045\5\25\0005\6\26\0=\6\27\5=\5\28\0045\5\29\0005\6\30\0=\6\t\0055\6\31\0=\6\5\0055\6 \0=\6\a\0055\6!\0=\6\"\0053\6#\0=\6\v\5=\5$\0044\5\0\0=\5%\4=\4&\3B\1\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\15min_height\1\3\0\0\3\n\4š³æÌ\t™³¦þ\3\1\3\0\0\3(\4š³æÌ\t™³¦þ\3\1\3\0\0\3Œ\1\4š³æÌ\t™³¦ÿ\3\1\0\2\rwinblend\3\n\17winhighlight\5\1\0\4\rrelative\vcursor\vanchor\aNW\vborder\frounded\15max_height\4Í™³æ\fÌ™³ÿ\3\bnui\vborder\1\0\1\nstyle\frounded\1\0\4\14max_width\3P\rposition\b50%\rrelative\vcursor\15max_height\3(\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0€€€ÿ\3\vheight\4š³æÌ\t™³æþ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\1\fenabled\2\ninput\1\0\0\roverride\0\16win_options\1\0\2\rwinblend\3\n\17winhighlight\5\14min_width\1\3\0\0\3\20\4š³æÌ\t™³¦þ\3\14max_width\1\3\0\0\3Œ\1\4Í™³æ\fÌ™³ÿ\3\1\0\b\17prefer_width\3(\16insert_only\2\vborder\frounded\17prompt_align\tleft\fenabled\2\vanchor\aNW\19default_prompt\vInput:\rrelative\vcursor\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n°\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15typescript\1\2\0\0\20template_string\15javascript\1\0\0\1\2\0\0\20template_string\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nI\0\0\5\0\6\0\b6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2'\3\4\0005\4\5\0D\0\4\0\1\0\1\nplain\2\6.\rfiletype\abo\nsplit\bvim€\4\1\0\n\0\19\0%6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\1\4\0015\3\5\0004\4\0\b9\5\6\0005\6\n\0005\a\b\0004\b\3\0005\t\a\0>\t\1\b=\b\t\a=\a\v\6<\6\5\4=\4\f\0033\4\r\0=\4\14\3B\1\2\0016\1\0\0'\3\15\0B\1\2\0029\1\16\1B\1\1\0016\1\0\0'\3\17\0B\1\2\0029\1\16\1B\1\1\0016\1\0\0'\3\18\0B\1\2\1K\0\1\0\24patch.snippets.init\"luasnip.loaders.from_snipmate\14lazy_load luasnip.loaders.from_vscode\fft_func\0\rext_opts\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\15choiceNode\fComment\15choiceNode\1\0\6\24delete_check_events\16TextChanged\22ext_prio_increase\3\1\18update_events\29TextChanged,TextChangedI\fhistory\1\24enable_autosnippets\1\18ext_base_prio\3¬\2\15set_config\vconfig\fluasnip\23luasnip.util.types\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: tmux-navigator.nvim
time([[Config for tmux-navigator.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\fenabled\2\19DisableMapping\2\nsetup\19tmux-navigator\frequire\0", "config", "tmux-navigator.nvim")
time([[Config for tmux-navigator.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandå\1\0\0\4\0\v\0\0286\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0029\1\5\1\a\1\6\0X\1\3€+\1\2\0L\1\2\0X\1\14€9\1\a\0'\3\b\0B\1\2\2\14\0\1\0X\1\5€9\1\t\0'\3\n\0B\1\2\2\19\1\1\0X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0K\0\1\0\fComment\20in_syntax_group\fcomment\26in_treesitter_capture\6c\tmode\18nvim_get_mode\bapi\bvim\23cmp.config.context\frequire/\0\2\4\1\2\0\a9\2\1\1=\2\0\1-\2\0\0009\3\1\0018\2\3\2=\2\1\1L\1\2\0\5À\tkind\tmenuÓ\1\0\1\4\3\6\0\30-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\20€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\v€-\1\2\0B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\4\0015\3\5\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\4À\1\0\1\vselect\2\fconfirm\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÓ\f\1\0\16\0U\0’\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0009\2\4\0026\3\0\0'\5\5\0B\3\2\0029\3\1\0039\3\6\0033\4\a\0006\5\b\0009\5\t\5'\6\v\0=\6\n\0055\5\f\0009\6\r\0005\b\17\0005\t\15\0003\n\14\0=\n\16\t=\t\18\b3\t\19\0=\t\20\b5\t\21\0004\n\3\0009\v\22\3>\v\1\n9\v\23\3>\v\2\n=\n\24\t=\t\25\b5\t\27\0005\n\26\0=\n\28\t3\n\29\0=\n\30\t=\t\31\b9\t \0009\t!\t9\t\"\t5\v$\0009\f \0009\f#\f)\14üÿB\f\2\2=\f%\v9\f \0009\f#\f)\14\4\0B\f\2\2=\f&\v9\f \0009\f'\fB\f\1\2=\f(\v9\f \0009\f)\fB\f\1\2=\f*\v9\f \0009\f+\f5\14.\0009\15,\0009\15-\15=\15/\14B\f\2\2=\f0\v9\f \0003\0141\0005\0152\0B\f\3\2=\f3\v9\f \0003\0144\0005\0155\0B\f\3\2=\f6\vB\t\2\2=\t \b5\t>\0004\n\b\0009\v7\2>\v\1\n9\v8\2>\v\2\n9\v9\2>\v\3\n9\v:\2>\v\4\n9\v;\2>\v\5\n9\v<\2>\v\6\n9\v=\2>\v\a\n=\n?\t=\t@\b9\t\3\0009\tA\t4\v\4\0005\fB\0>\f\1\v5\fC\0>\f\2\v5\fD\0>\f\3\vB\t\2\2=\tA\b9\tE\0009\tF\t=\tG\bB\6\2\0016\6\0\0'\bH\0B\6\2\0029\aI\0\18\t\a\0009\aJ\a'\nK\0009\vL\0065\rN\0005\14M\0=\14O\rB\v\2\0A\a\2\0019\a\r\0009\aP\a'\tQ\0005\nT\0009\v\3\0009\vA\v4\r\3\0005\14R\0>\14\1\r4\14\3\0005\15S\0>\15\1\14B\v\3\2=\vA\nB\a\3\0012\0\0€K\0\1\0\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\14preselect\tItem\18PreselectMode\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nscore\nexact\voffset\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-d>\n<C-f>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\15completion\17autocomplete\16TextChanged\16InsertEnter\1\0\1\19keyword_length\3\1\fenabled\0\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\25\tUnit\bï¥¬\rProperty\bï° \nField\bï° \vModule\bï£’\16Constructor\bâŒ˜\14Interface\bïƒ¨\tFile\bïœ˜\nClass\bï´¯\rOperator\bïš”\rVariable\bïœ›\18TypeParameter\5\vStruct\bï­„\rConstant\bï£¿\15EnumMember\bï…\rFunction\bïž”\vFolder\bï»\vMethod\bïš¦\14Reference\bïœ†\tText\bïƒ‰\nEvent\bïƒ§\nColor\bï£—\fSnippet\bï™°\fKeyword\bï¨‹\tEnum\bï…\nValue\bï¢Ÿ\26menu,menuone,noselect\16completeopt\6o\bvim\0\17TriggerEvent\14cmp.types\fcompare\vconfig\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nN\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\18format_buffer\23patch.utils.format\frequire¹\6\1\2\14\2%\0\\5\2\0\0=\1\1\0026\3\2\0006\5\3\0009\5\4\0059\5\5\5B\3\2\4H\6\b€6\b\6\0009\b\a\b9\b\b\b'\n\t\0\18\v\6\0\18\f\a\0\18\r\2\0B\b\5\1F\6\3\3R\6ö\1276\3\n\0006\5\v\0'\6\f\0B\3\3\3\15\0\3\0X\5\b€9\5\r\0009\5\14\5\15\0\5\0X\6\4€9\5\15\4\18\a\0\0\18\b\1\0B\5\3\0016\5\3\0009\5\16\5\15\0\5\0X\6\25€9\5\17\0'\a\18\0B\5\2\2\15\0\5\0X\6\20€6\5\6\0009\5\19\0059\5\20\0055\a\21\0005\b\23\0-\t\0\0009\t\22\t=\t\24\b=\1\1\bB\5\3\0016\5\6\0009\5\19\0059\5\20\0055\a\25\0005\b\27\0-\t\0\0009\t\26\t=\t\24\b=\1\1\bB\5\3\0016\5\3\0009\5\28\0059\5\29\5\15\0\5\0X\6\24€9\5\17\0'\a\30\0B\5\2\2\15\0\5\0X\6\19€6\5\6\0009\5\19\0059\5\31\0055\a \0-\b\1\0=\b!\a=\1\1\aB\5\2\0016\5\6\0009\5\19\0059\5\20\5'\a\"\0005\b#\0-\t\1\0=\t!\b=\1\1\b3\t$\0=\t\24\bB\5\3\0012\0\0€K\0\1\0\aÀ\tÀ\0\1\0\0\16BufWritePre\ngroup\1\0\0\24nvim_clear_autocmds\28textDocument/formatting\19format_on_save\15formatting\1\0\0\21clear_references\1\3\0\0\16CursorMoved\17CursorMovedI\rcallback\1\0\0\23document_highlight\1\3\0\0\15CursorHold\16CursorHoldI\24nvim_create_autocmd\bapi#textDocument/documentHighlight\20supports_method\30highlightTokenUnderCursor\vattach\27documentSymbolProvider\24server_capabilities\15nvim-navic\frequire\npcall\6n\bset\vkeymap\bvim\fkeymaps\blsp\14LSPConfig\npairs\vbuffer\1\0\2\fnoremap\2\vsilent\2*\0\2\3\0\2\0\3'\2\1\0=\2\0\0K\0\1\0\vutf-32\20offset_encodingà\n\1\0\28\0A\0²\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0026\a\b\0009\a\t\a9\a\n\a4\b\r\0006\t\0\0'\v\v\0B\t\2\2>\t\1\b9\t\f\0019\t\r\t9\t\14\t>\t\2\b9\t\f\0019\t\15\t9\t\16\t>\t\3\b9\t\f\0019\t\15\t9\t\17\t>\t\4\b9\t\f\0019\t\15\t9\t\18\t>\t\5\b9\t\f\0019\t\15\t9\t\19\t>\t\6\b9\t\f\0019\t\15\t9\t\20\t>\t\a\b9\t\f\0019\t\15\t9\t\21\t>\t\b\b9\t\f\0019\t\22\t9\t\23\t>\t\t\b9\t\f\0019\t\24\t9\t\25\t9\t\26\t5\v\29\0006\f\27\0009\f\28\f=\f\30\vB\t\2\2>\t\n\b9\t\f\0019\t\24\t9\t\31\t>\t\v\b9\t\f\0019\t\24\t9\t \t>\t\f\b6\t\b\0009\t!\t9\t\"\t'\v#\0004\f\0\0B\t\3\0023\n$\0005\v)\0006\f\b\0009\f\t\f9\f\26\f6\14\b\0009\14\t\0149\14%\0149\14&\0146\15\27\0009\15'\0159\15(\15B\f\3\2=\f*\v9\f+\0066\14\b\0009\14\t\0149\14,\0149\14-\14B\14\1\0A\f\0\0025\r.\0=\n/\r=\f0\r=\v%\r9\0141\0056\16\b\0009\0162\16'\0183\0006\19\27\0009\0194\0195\0205\0=\r6\20B\16\4\0A\14\0\0019\0141\0026\16\27\0009\16\3\0169\0167\16B\14\2\0019\0141\0036\16\27\0009\16\3\0169\0168\16B\14\2\0019\0141\0046\16\27\0009\16\3\0169\0169\16B\14\2\0019\0141\0015\16:\0=\b;\0163\17<\0=\17=\16B\14\2\0014\14\0\0006\15>\0006\17\27\0009\17\t\0179\17?\17B\15\2\4H\18\2€4\20\0\0<\20\19\14F\18\3\3R\18ü\1276\15\b\0009\0152\15'\0173\0004\18\0\0\18\19\14\0006\20\27\0009\20\t\0209\20@\20B\15\5\0026\16>\0\18\18\15\0B\16\2\4H\19\t€8\21\19\0009\0211\0216\23\b\0009\0232\23'\0253\0\18\26\r\0\18\27\20\0B\23\4\0A\21\0\1F\19\3\3R\19õ\1272\0\0€K\0\1\0\rextended\fdefault\npairs\fon_init\0\fsources\1\0\0\19null_ls_config\19lspconf_config\vconfig\vserver\1\0\0\21typescript_setup\nforce\20tbl_deep_extend\nsetup\17capabilities\14on_attach\1\0\0\29make_client_capabilities\rprotocol\25default_capabilities\23textDocument/hover\1\0\0\23hover_float_config\aui\nhover\rhandlers\0\18LspFormatting\24nvim_create_augroup\bapi\17clang_format\vstylua\14filetypes\1\0\1\ftimeout\3ˆ'\23prettier_filetypes\14LSPConfig\twith\rprettier\15formatting\ttags\15completion\rhadolint\fgitlint\fcpplint\15commitlint\14codespell\15cmake_lint\16diagnostics\rgitsigns\17code_actions\rbuiltins\"patch.code-actions.typescript\bbuf\blsp\bvim\17cmp_nvim_lsp\15typescript\18mason-null-ls\20mason-lspconfig\nmason\fnull-ls\14lspconfig\frequire\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-surround ]]

-- Config for: nvim-surround
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Obsess lua require("packer.load")({'vim-obsession'}, { cmd = "Obsess", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeoRunner lua require("packer.load")({'neo-runner.nvim'}, { cmd = "NeoRunner", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
