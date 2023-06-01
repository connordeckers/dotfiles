function wl-paste --description 'alias wl-paste wl-paste'
 string replace -a \r '' -- (command wl-paste -- $argv)
end
