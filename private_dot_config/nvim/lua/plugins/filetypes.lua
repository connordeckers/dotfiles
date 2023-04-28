return {
  --- Syntax highlighting ---
  { 'fladson/vim-kitty', ft = 'kitty' },
  { 'isobit/vim-caddyfile', ft = 'caddyfile' },
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      vim.g['chezmoi#use_tmp_buffer'] = true
    end,
  },
}
