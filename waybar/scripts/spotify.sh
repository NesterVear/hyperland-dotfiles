#!/bin/bash

status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    artist=$(playerctl --player=spotify metadata artist)
    title=$(playerctl --player=spotify metadata title)
    icon="<span color='#1DB954'></span>"  # Verde Spotify
    echo "$icon  $artist - $title"

elif [ "$status" = "Paused" ]; then
    artist=$(playerctl --player=spotify metadata artist)
    title=$(playerctl --player=spotify metadata title)
    icon="<span color='#cccccc'></span>"  # Gris claro
    echo "$icon  $artist - $title"
else
    echo ""  # Spotify no abierto o sin música
fi

