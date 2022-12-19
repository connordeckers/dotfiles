#!/bin/bash

script='/home/connor/.config/polybar/modules/spotify/get_status.sh';

# see man zscroll for documentation of the following parameters
zscroll -l 40 \
        --delay 0.1 \
        --match-command "$(echo $script playing)" \
        --match-text "1" "--scroll 1" \
        --match-text "0" "--scroll 0" \
        --update-check true "$script status" &

wait