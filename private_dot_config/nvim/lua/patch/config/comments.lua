require('patch.utils').safe_setup('Comment', {
  ---Add a space b/w comment and the line
  ---@type boolean|fun():boolean
  padding = true,

  --- Trim left and right sides of block comments before inserting
  trim = false,

  ---Whether the cursor should stay at its position
  ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
  ---@type boolean
  sticky = true,

  --- Disable baked in mappings; we'll configure it ourselves in keybinds.lua
  mappings = false,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|fun():string
  -- ignore = nil,
  ignore = '^$',

  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  ---NOTE: If `mappings = false` then the plugin won't create any mappings
  ---@type boolean|table
  --mappings = false,

  ---Pre-hook, called before commenting the line
  ---@type fun(ctx:CommentCtx):any|nil
  pre_hook = nil,
  -- pre_hook = function(ctx)
  -- Only calculate commentstring for tsx filetypes
  --if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'javascript' then
  -- local utils = require 'ts_context_commentstring.utils'
  -- local inter = require 'ts_context_commentstring.internal'
  --[[ local comment_utils = require 'comment.utils' ]]

  -- Determine whether to use linewise or blockwise commentstring
  -- local type = ctx.ctype == comment_utils.ctype.linewise and '__default' or '__multiline'

  -- Determine the location where to calculate commentstring from
  -- local location = nil
  -- if ctx.ctype == comment_utils.ctype.blockwise then
  -- location = utils.get_cursor_location()
  -- elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
  -- location = utils.get_visual_start_location()
  -- end

  -- require 'notify'(vim.inspect {
  -- ctx.ctype,
  -- ctx.cmotion,
  -- location,
  -- ctx.ctype == comment_utils.ctype.blockwise,
  -- ctx.cmotion == comment_utils.cmotion.v,
  -- ctx.cmotion == comment_utils.cmotion.V,
  -- })

  -- return inter.calculate_commentstring { key = type, location = location }
  --end
  -- end,

  ---Post-hook, called after commenting is done
  ---@type fun(ctx: CommentCtx)
  post_hook = nil,
})
