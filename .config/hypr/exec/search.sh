# Rofi theme and message
rofi_theme="$HOME/.config/rofi/config-search.rasi"
msg='Google Search'

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

# Open Rofi and pass the selected query to xdg-open for Google search
echo "" | rofi -dmenu -config "$rofi_theme" -mesg "$msg" | xargs -I{} xdg-open "https://www.google.com/search?q={}" || true
