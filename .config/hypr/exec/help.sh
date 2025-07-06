#!/bin/bash

BACKEND=wayland

Check if rofi or yad is running and kill them if they are
if pidof rofi > /dev/null; then
  pkill rofi
fi

if pidof yad > /dev/null; then
  pkill yad
fi

Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad \
    --center \
    --title="Help" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
    "" "" "" \
    "<b>super</b>-<b>space</b>" "Float mode" "togglefloating" \
    "<b>super</b>-<b>q</b>" "Close without killing process" "killactive" \
    "<b>super</b>-<b>w</b>" "Clipboard manager" "ClipManager.sh" \
    "<b>super</b>-<b>e</b>" "Rofi application launcher" "pkill rofi || true &amp;&amp; rofi -show drun -modi drun,filebrowser,run,window" \
    "<b>super</b>-<b>r</b>" "Pseudo-full screen" "1" \
    "<b>super</b>-<b>shift</b>-<b>q</b>" "Kill active process" "KillActiveProcess.sh" \
    "<b>super</b>-<b>shift</b>-<b>w</b>" "TODO (Clip Manager)" "TODO: Modifier for Clip Manager" \
    "<b>super</b>-<b>shift</b>-<b>e</b>" "Application overview with ags" "pkill rofi || true &amp;&amp; ags -t 'overview'" \
    "<b>super</b>-<b>shift</b>-<b>r</b>" "Full screen" "fullscreen" \
    "<b>super</b>-<b>a</b>" "Focus Zed, opening it first if necessary" "hyprctl dispatch focuswindow || zed" \
    "<b>super</b>-<b>s</b>" "Focus Firefox, opening it first if necessary" "hyprctl dispatch focuswindow || firefox" \
    "<b>super</b>-<b>d</b>" "Focus Obsidian, opening it first if necessary" "hyprctl dispatch focuswindow || xdg-open obsidian://vault" \
    "<b>super</b>-<b>f</b>" "Focus Ghostty, opening it first if necessary" "hyprctl dispatch focuswindow || ghostty" \
    "<b>super</b>-<b>z</b>" "Focus Yubico Authenticator, opening it first if necessary" "hyprctl dispatch focuswindow || /opt/yubico-authenticator/authenticator" \
    "<b>super</b>-<b>x</b>" "Focus Spotify, opening it first if necessary" "hyprctl dispatch focuswindow || spotify" \
    "<b>super</b>-<b>v</b>" "Focus Thunar, opening it first if necessary" "hyprctl dispatch focuswindow || thunar" \
    "<b>super</b>-<b>shift</b>-<b>a</b>" "TODO (Zed)" "TODO: TBD" \
    "<b>super</b>-<b>shift</b>-<b>s</b>" "Search on Google with Rofi" "RofiSearch.sh" \
    "<b>super</b>-<b>shift</b>-<b>d</b>" "TODO (Obsidian - Work)" "TODO: Shortcut for getting to Obsidian WORK vault" \
    "<b>super</b>-<b>shift</b>-<b>f</b>" "Open a floating Ghostty window" "[float; move 25% 25%; size 50% 50%; workspace unset] ghostty" \
    "<b>super</b>-<b>shift</b>-<b>z</b>" "Open a floating Yubico Authenticator window" "[float; size 25% 90%; move 72.5% 5%] /opt/yubico-authenticator/authenticator" \
    "<b>super</b>-<b>shift</b>-<b>x</b>" "TODO (Spotify)" "TODO: Shortcut for getting to Spotify miniplayer" \
    "<b>super</b>-<b>shift</b>-<b>c</b>" "TODO (Discord)" "TODO: Shortcut for responding to Discord messages" \
    "<b>super</b>-<b>shift</b>-<b>v</b>" "Open floating Thunar window" "[float; size 25% 90%; move 72.5% 5%] thunar" \
    "<b>super</b>-<b>alt</b>-<b>l</b>" "Change pane layout (master, dwindle)" "ChangeLayout.sh" \
    "<b>super</b>-<b>h</b>" "Show this Help dialog" "help.sh" \
    "<b>super</b>-<b>alt</b>-<b>e</b>" "Pick an Emoji using Rofi" "RofiEmoji.sh" \
    "<b>super</b>-<b>ctrl</b>-<b>alt</b>-<b>b</b>" "Toggle hide/show Waybar" "pkill -SIGUSR1 waybar" \
    "<b>super</b>-<b>ctrl</b>-<b>b</b>" "Waybar Styles Menu" "WaybarStyles.sh" \
    "<b>super</b>-<b>alt</b>-<b>b</b>" "Waybar Layout Menu" "WaybarLayout.sh" \
    "" "" "" \
    "Change binds: " "nvim ~/.config/hypr/conf/bind.conf" "" \
