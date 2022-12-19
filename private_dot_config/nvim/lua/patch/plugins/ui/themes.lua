local packer = require 'packer'
local use = packer.use

-- Themes
use { 'sainnhe/gruvbox-material', disable = true }
use { 'RRethy/nvim-base16', disable = true }
use {
  'navarasu/onedark.nvim',
  disable = true,
  config = function()
    local theme = require 'onedark'
    theme.setup {
      style = 'dark',
      transparent = false,
      code_style = {
        comments = 'italic',
        keywords = 'italic',
        functions = 'none',
        strings = 'none',
        variables = 'none',
      },
    }
    theme.load()
  end,
}

use {
  'rose-pine/neovim',
  as = 'rose-pine',
  -- disable = true,
  config = function()
    require('rose-pine').setup {
      --- @usage 'main' | 'moon'
      dark_variant = 'moon',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = false,
      disable_italics = false,

      --- @usage string hex value or named color from rosepinetheme.com/palette
      groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- Change specific vim highlight groups
      highlight_groups = {
        ColorColumn = { bg = 'rose' },
      },
    }

    -- set colorscheme after options
    vim.cmd 'colorscheme rose-pine'
  end,
}
