#!/bin/bash
# Google Search in the default browser via Rofi

# Define the path to the config file
defaults=$HOME/.config/hypr/conf/defaults.conf

# Check if the config file exists
if [[ ! -f "$defaults" ]]; then
    echo "Error: Defaults configuration file not found at $defaults"
    exit 1
fi

# Process the config file in memory, removing the $ and fixing spaces
config_content=$(sed 's/\$//g' "$defaults" | sed 's/ = /=/')

# Source the modified content directly from the variable
eval "$config_content"

# Check if $term is set correctly
if [[ -z "$search" ]]; then
    echo "Error: \$search is not set in the configuration file!"
    exit 1
fi
# Rofi theme and message
rofi_theme="$HOME/.config/rofi/config-search.rasi"
msg='Google Search'

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

# Open Rofi and pass the selected query to xdg-open for Google search
echo "" | rofi -dmenu -config "$rofi_theme" -mesg "$msg" | xargs -I{} xdg-open "$search" || true
