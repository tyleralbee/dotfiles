#!/usr/bin/env bash
#
# Waybar hot reload
#
# NOTE: inotify is a Linux kernel subsystem.
#
# Author: Tyler Albee <tyleralbee25@gmail.com>

waybar_config_dir="$XDG_CONFIG_HOME/waybar"
waybar_config_file="$waybar_config_dir/config.jsonc"
waybar_style_file="$waybar_config_dir/style.css"

trap "killall waybar" EXIT

while true; do
    waybar &
    inotifywait -e modify "$waybar_config_dir"
    killall waybar
done
