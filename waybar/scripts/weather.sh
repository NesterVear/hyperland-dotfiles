weather=$(curl -s 'wttr.in/Mexico?format=%C' | tr '[:upper:]' '[:lower:]')

# Si viene vacío, usar fallback
if [[ -z "$weather" ]]; then
  icon="🌡️"
else
  case "$weather" in
    *sun*)     icon="☀️" ;;
    *clear*)   icon="☀️" ;;
    *cloud*)   icon="☁️" ;;
    *rain*)    icon="🌧️" ;;
    *snow*)    icon="❄️" ;;
    *thunder*) icon="🌩️" ;;
    *fog*)     icon="🌫️" ;;
    *)         icon="🌡️" ;;
  esac
fi

echo "$icon"

