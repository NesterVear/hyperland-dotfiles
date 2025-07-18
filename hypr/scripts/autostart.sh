#!/bin/bash

swww init & sleep 1
swww img /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &

waybar &
nm-applet --indicator &
dunst &

swayidle -w \
	timeout 7200 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' &
