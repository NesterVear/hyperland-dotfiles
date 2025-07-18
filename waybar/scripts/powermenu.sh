#!/bin/bash

choice=$(echo -e "Cerrar sesión\nSuspender\nReiniciar\nApagar" | wofi --dmenu --prompt "Power menu")

case "$choice" in
  "Cerrar sesión")
    hyprctl dispatch exit
    ;;
  "Suspender")
    systemctl suspend
    ;;
  "Reiniciar")
    systemctl reboot
    ;;
  "Apagar")
    systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac

