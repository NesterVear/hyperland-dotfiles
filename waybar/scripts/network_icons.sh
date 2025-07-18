#!/bin/bash

# Detecta si hay red ethernet activa
eth=$(ip link show | grep -E 'enp|eth' | grep 'state UP')
wifi_dev=$(iw dev 2>/dev/null | grep Interface | awk '{print $2}')
wifi_up=$(ip link show "$wifi_dev" 2>/dev/null | grep 'state UP')

# Verifica intensidad de señal si hay Wi-Fi
if [[ $wifi_up ]]; then
    signal=$(grep "$wifi_dev" /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
    if (( $signal > 75 )); then
        echo '{"text":"󰤨","class":"wifi-strong"}'
    elif (( $signal > 50 )); then
        echo '{"text":"󰤥","class":"wifi-medium"}'
    elif (( $signal > 25 )); then
        echo '{"text":"󰤢","class":"wifi-weak"}'
    else
        echo '{"text":"󰤟","class":"wifi-bad"}'
    fi
elif [[ $eth ]]; then
    echo '{"text":"󰈁","class":"ethernet"}'
else
    echo '{"text":"󰖪","class":"disconnected"}'
fi
