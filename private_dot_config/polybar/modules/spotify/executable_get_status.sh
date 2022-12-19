#!/bin/bash
function status() {
  status=$(playerctl --player=playerctld status 2>&1)
  if [ "$status" == "Stopped" ] || [ "$status" == "No player could handle this command" ]; then
      echo "Nothing playing"
      polybar-msg -p $(pidof polybar) hook spotify-play-pause 2 >/dev/null
  elif [ "$status" == "Paused" ]; then
      polybar-msg -p $(pidof polybar) hook spotify-play-pause 2 >/dev/null
      playerctl --player=playerctld metadata --format "{{ title }} - {{ album }} - {{ artist }}        "
  else # Can be configured to output differently when player is paused
      polybar-msg -p $(pidof polybar) hook spotify-play-pause 1 >/dev/null
      playerctl --player=playerctld metadata --format "{{ title }} - {{ album }} - {{ artist }}        "
  fi
}

function playing() {
  status=$(playerctl --player=playerctld status 2>&1)
  if [ "$status" == "Playing" ]; then
      echo 1;
  else
    echo 0;
  fi
}

case "$1" in
    playing)
        playing
        ;;
    status)
        status
        ;;
    *)
        playing
        ;;
esac
