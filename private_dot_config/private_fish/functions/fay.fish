function _fay_keys
	echo "\
KEYBINDINGS:
                     TAB : Select
               Shift-TAB : Unselect
                  Ctrl-d : Deselect all
                  Ctrl-i : Install selected
                  Ctrl-r : Uninstall selected
                  Ctrl-u : Update all packages
                  Ctrl-n : History next
                  Ctrl-p : History previous
                  Ctrl-/ : Change layout
                  Ctrl-v : Hide/show preview
                    HOME : Top
                     END : Bottom
                  PAGEUP : Scroll one page up
                PAGEDOWN : Scroll one page down
                  Ctrl-l : Clear query
           Alt-backspace : Clear query
                Alt-left : Delete word
                 Ctrl-h  : Show help
                       ? : Show keybindings
                  Ctrl-c : Exit
                  Ctrl-q : Exit
                     ESC : Exit\
	 "
end

function fay
	if not set -q fish_fay_history
		set -g fish_fay_history $XDG_CACHE_HOME/fish/fay_history
	end

	# Make sure it doesn't exist
	if not test -e $fish_fay_history
		command mkdir -p (path resolve $fish_fay_history | path dirname)
	end

	if not set -q fish_fay_preview_cmd
		set -g fish_fay_preview_cmd "printf '%s\n' (_fay_resources {1})"
	end

	set -l matches (
		yay -Ss --singlelineresults --color always --bottomup 2>/dev/null | 
			string match -vr '(\(Orphan.*\)|\(Out.*\))' | 
			column --separator=\t --output-separator=': ' --table --output-width=(math floor \($COLUMNS / 4\))
	)

	set -l bindings
	
	set -a bindings 'ctrl-i:execute:yay -S $(echo {+} | cut -d" " -f1)'
	set -a bindings 'ctrl-x:execute:yay -S $(echo {+} | cut -d" " -f1)'
	set -a bindings 'ctrl-r:execute:yay -R $(echo {1} | cut -d"/" -f2)'
	set -a bindings "ctrl-u:execute:yay -Syu"
	set -a bindings 'ctrl-/:change-preview-window(up,border-rounded|up,40%,border-rounded|left,border-rounded|left,border-rounded,40%|down,border-rounded|down,40%,border-rounded|down,10%,border-rounded|hidden|right,40%,border-rounded|right,70%,border-rounded|right,90%,border-rounded)'
	set -a bindings 'ctrl-l:clear-query+clear-screen+clear-selection'
	set -a bindings 'alt-bspace:clear-query'
	set -a bindings 'alt-left:kill-word'
	set -a bindings "esc:abort"
	set -a bindings 'ctrl-c:abort'
	set -a bindings 'ctrl-d:deselect-all'
	set -a bindings 'ctrl-q:print-query'
	set -a bindings 'ctrl-v:toggle-preview'
	set -a bindings 'ctrl-n:next-history'
	set -a bindings 'ctrl-p:previous-history'
	set -a bindings 'right:first'
	set -a bindings 'left:first'
	set -a bindings 'end:first'
	set -a bindings 'home:last'
	set -a bindings 'pgdn:page-down'
	set -a bindings 'pgup:page-up'
	set -a bindings 'shift-tab:deselect'
	set -a bindings 'tab:select'
	set -a bindings 'ctrl-s:select'
	set -a bindings "?:preview(echo '$(_fay_keys)')"
	set -a bindings 'change:first'

	set -l fzf_label 'fay'
	if test (count $argv) -gt 0
		set fzf_label $argv
	end

	set -l cmd fzf
	
	set -l args
	set -a args "header=Press ? for keybindings"
	set -a args "preview-window=bottom,43%,border-double"
	set -a args "history=$fish_fay_history"
	set -a args "query=$argv"
	set -a args "preview-label-pos=top"
	set -a args "border-label-pos=3"
	set -a args "border=top"
	set -a args "preview-label=╣$fzf_label╠"
	set -a args "border-label=┨fay┠"
	set -a args "info=inline"
	set -a args "scroll-off=20"
	set -a args "hscroll-off=30"
	set -a args "ellipsis="
	set -a args "tiebreak=begin"
	set -a args "sync"
	set -a args "multi"
	set -a args "ansi"
	set -a args "preview=$fish_fay_preview_cmd"

	printf "%s\n" $matches | $cmd --bind=$bindings --$args
end
