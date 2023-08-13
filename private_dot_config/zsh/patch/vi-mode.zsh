###################################
##         Cursor styles         ##
###################################
#																	#
#   ZVM_CURSOR_USER_DEFAULT				#
#   ZVM_CURSOR_BLOCK							#
#   ZVM_CURSOR_UNDERLINE					#
#   ZVM_CURSOR_BEAM								#
#   ZVM_CURSOR_BLINKING_BLOCK     #
#   ZVM_CURSOR_BLINKING_UNDERLINE #
#   ZVM_CURSOR_BLINKING_BEAM			#
#																	#
###################################

# The prompt cursor in normal mode
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# The prompt cursor in insert mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM

# The prompt cursor in visual mode
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# The prompt cursor in visual line mode
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# The prompt cursor in operator pending mode
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

# Set the commands for clipboard
ZVM_CLIP_COPY="clipcopy"
ZVM_CLIP_PASTE="clippaste"

# The plugin will auto execute this zvm_after_select_vi_mode function
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      export VIMODE="normal"
    ;;
    $ZVM_MODE_INSERT)
      export VIMODE="insert"
    ;;
    $ZVM_MODE_VISUAL)
      export VIMODE="visual"
    ;;
    $ZVM_MODE_VISUAL_LINE)
      export VIMODE="visual line"
    ;;
    $ZVM_MODE_REPLACE)
      export VIMODE="replace"
    ;;
  esac
}
