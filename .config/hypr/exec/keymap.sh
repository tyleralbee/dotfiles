#!/bin/bash

# kill yad to not interfere
pkill yad || true

# check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# define the config files
keybinds_conf="$HOME/.config/hypr/conf/bind.conf"
rofi_theme="$HOME/.config/rofi/config-keybinds.rasi"
msg='NOTE: Clicking with Mouse or Pressing ENTER will have NO function'

# combine the contents of the keybinds files and filter for keybinds
keybinds=$(cat "$keybinds_conf" | grep -E '^bind')

# check for any keybinds to display
if [[ -z "$keybinds" ]]; then
    echo "no keybinds found."
    exit 1
fi

# replace $mainMod with SUPER in the keybinds content
display_keybinds=$(echo "$keybinds" | sed 's/\$mainMod/SUPER/g')

# use rofi to display the keybinds with the modified content
echo "$display_keybinds" | rofi -dmenu -i -config "$rofi_theme" -mesg "$msg"
