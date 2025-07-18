#!/bin/bash

volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
    echo "󰝟  $volume%"  # Icono muteado
else
    if [ "$volume" -gt 70 ]; then
        icon="󰕾"  # Alto
    elif [ "$volume" -gt 30 ]; then
        icon="󰖀"  # Medio
    else
        icon="󰕿"  # Bajo
    fi
    echo "$icon  $volume%"
fi

