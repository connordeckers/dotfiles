local packer = require 'packer'
local use = packer.use

-- local banned_messages = { 'No information available', 'multiple different client offset_encodings' }

use {
  'folke/noice.nvim',
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI

        --- @type table<string, CmdlineFormat>
        format = {
          lua = { pattern = '^:%s*lua=?%s+', icon = '', lang = 'lua' },
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
      views = {}, ---@see section on views

      ---@type NoiceRouteConfig[]
      routes = {
        {
          filter = {
            any = {
              { find = 'search hit' },
              { find = 'Diagnosing' },
              { find = 'Processing full semantic tokens' },
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

      ---@type table<string, NoiceFilter>
      status = {}, --- @see section on statusline components

      ---@type NoiceFormatOptions
      format = {}, --- @see section on formatting
    }
  end,
}
