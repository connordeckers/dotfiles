#!/bin/bash
if ! [[ $(i3-msg [class="$1"] focus 2>/dev/null) =~ "\"success\":true" ]]; then
  i3-msg exec ${2-$1} 2>&1>/dev/null
fi
