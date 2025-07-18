#!/bin/bash

# Verifica si el adaptador Bluetooth está encendido
power=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

# Verifica si hay algún dispositivo conectado
connected=$(bluetoothctl info | grep "Connected: yes")

if [[ "$power" == "yes" && "$connected" ]]; then
  echo '{"text":"󰂯","class":"bt-on"}'  # conectado
elif [[ "$power" == "yes" ]]; then
  echo '{"text":"󰂯","class":"bt-off"}' # encendido, pero sin conexión
else
  echo '{"text":"󰂲","class":"bt-off"}' # apagado
fi
