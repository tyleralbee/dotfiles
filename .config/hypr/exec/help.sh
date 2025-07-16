#!/bin/bash

BACKEND=wayland

Check if rofi or yad is running and kill them if they are
if pidof rofi >/dev/null; then
    pkill rofi
fi

if pidof yad >/dev/null; then
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
    "<b>super</b>-<b>shift</b>-<b>l</b>" "Lock screen" "LockScreen.sh" \
    "<b>super</b>-<b>shift</b>-<b>p</b>" "Log out" "Wlogout.sh" \
    "<b>super</b>-<b>shift</b>-<b>n</b>" "Open notifications" "swaync-client -t -sw" \
    "<b>alt</b>-<b>tab</b>" "Go to next application in workspace" "cyclenext" \
    "<b>alt</b>-<b>tab</b>" "Bring active application in workspace to top of view hierarchy" "bringactivetotop" \
    "<b>super</b>-<b>q</b>" "Close the focused application" "killactive" \
    "<b>super</b>-<b>w</b>" "Run bash script ClipManager.sh" "ClipManager.sh" \
    "<b>super</b>-<b>e</b>" "Execute pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window" "pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window" \
    "<b>super</b>-<b>r</b>" "Enter fullscreen" "fullscreen, 1" \
    "<b>super</b>-<b>t</b>" "Run bash script ScreenShot.sh --swappy" "ScreenShot.sh --swappy" \
    "<b>super</b>-<b>shift</b>-<b>q</b>" "Run bash script KillActiveProcess.sh" "KillActiveProcess.sh" \
    "<b>super</b>-<b>shift</b>-<b>e</b>" "Execute pkill rofi || true && ags -t 'overview'" "pkill rofi || true && ags -t 'overview'" \
    "<b>super</b>-<b>shift</b>-<b>r</b>" "Enter fullscreen" "fullscreen" \
    "<b>super</b>-<b>a</b>" "Focus zed, starting the application first if necessary" "ZED_PID=\$(pgrep zed) && hyprctl dispatch focuswindow \"pid:\$ZED_PID\" || \$HOME/.local/bin/zed" \
    "<b>super</b>-<b>s</b>" "Focus firefox, starting the application first if necessary" "FIREFOX_PID=\$(pgrep firefox) && hyprctl dispatch focuswindow \"pid:\$FIREFOX_PID\" || firefox" \
    "<b>super</b>-<b>d</b>" "Focus obsidian, starting the application first if necessary" "OBSIDIAN_PID=\$(pgrep -o obsidian) && hyprctl dispatch focuswindow \"class:obsidian\" || xdg-open \"obsidian://vault/\$OBSIDIAN_VAULT_PERSONAL\"" \
    "<b>super</b>-<b>f</b>" "Focus ghostty, starting the application first if necessary" "GHOSTTY_PID=\$(pgrep ghostty) && hyprctl dispatch focuswindow \"pid:\$GHOSTTY_PID\" || ghostty" \
    "<b>super</b>-<b>z</b>" "Focus yubico, starting the application first if necessary" "YUBICO_PID=\$(pgrep yubico) && hyprctl dispatch focuswindow \"pid:\$YUBICO_PID\" || /opt/yubico-authenticator/authenticator" \
    "<b>super</b>-<b>x</b>" "Focus spotify, starting the application first if necessary" "SPOTIFY_PID=\$(pgrep -o spotify) && hyprctl dispatch focuswindow \"pid:\$SPOTIFY_PID\" || spotify" \
    "<b>super</b>-<b>v</b>" "Focus thunar, starting the application first if necessary" "THUNAR_PID=\$(pgrep thunar) && hyprctl dispatch focuswindow \"pid:\$THUNAR_PID\" || thunar" \
    "<b>super</b>-<b>shift</b>-<b>s</b>" "Google search" "\$exec/search.sh" \
    "<b>super</b>-<b>shift</b>-<b>f</b>" "Open a floating terminal" "[float; move 25% 25%; size 50% 50%; workspace unset] ghostty" \
    "<b>super</b>-<b>shift</b>-<b>z</b>" "Open floating authenticator to the side" "[float; size 25% 90%; move 72.5% 5%] /opt/yubico-authenticator/authenticator" \
    "<b>super</b>-<b>shift</b>-<b>v</b>" "Open floating file explorer" "[float; size 25% 90%; move 72.5% 5%] thunar" \
    "<b>super</b>-<b>alt</b>-B" "Run bash script WaybarLayout.sh" "WaybarLayout.sh" \
    "<b>super</b>-<b>alt</b>-E" "Run bash script RofiEmoji.sh" "RofiEmoji.sh" \
    "<b>super</b>-<b>alt</b>-L" "Run bash script ChangeLayout.sh" "ChangeLayout.sh" \
    "<b>super</b>-CTRL <b>alt</b>-B" "Execute pkill -SIGUSR1 waybar" "pkill -SIGUSR1 waybar" \
    "<b>super</b>-<b>ctrl</b>-B" "Run bash script WaybarStyles.sh" "WaybarStyles.sh" \
    "<b>super</b>-<b>h</b>" "Show this help window" "\$exec/help.sh" \
    "<b>super</b>-<b>k</b>" "Show keymap shortcuts" "\$exec/keymap.sh" \
    "<b>super</b>-<b>space</b>" "Toggle floating mode" "togglefloating" \
    "<b>super</b>-<b>1</b>" "Go to workspace 1" "workspace, 1" \
    "<b>super</b>-<b>2</b>" "Go to workspace 2" "workspace, 2" \
    "<b>super</b>-<b>3</b>" "Go to workspace 3" "workspace, 3" \
    "<b>super</b>-<b>4</b>" "Go to workspace 4" "workspace, 4" \
    "<b>super</b>-<b>5</b>" "Go to workspace 5" "workspace, 5" \
    "<b>super</b>-<b>6</b>" "Go to workspace 6" "workspace, 6" \
    "<b>super</b>-<b>7</b>" "Go to workspace 7" "workspace, 7" \
    "<b>super</b>-<b>8</b>" "Go to workspace 8" "workspace, 8" \
    "<b>super</b>-<b>9</b>" "Go to workspace 9" "workspace, 9" \
    "<b>super</b>-<b>0</b>" "Go to workspace 10" "workspace, 10" \
    "<b>super</b>-<b>shift</b>-<b>1</b>" "Move app to workspace 1 and switch focus" "movetoworkspace, 1" \
    "<b>super</b>-<b>shift</b>-<b>2</b>" "Move app to workspace 2 and switch focus" "movetoworkspace, 2" \
    "<b>super</b>-<b>shift</b>-<b>3</b>" "Move app to workspace 3 and switch focus" "movetoworkspace, 3" \
    "<b>super</b>-<b>shift</b>-<b>4</b>" "Move app to workspace 4 and switch focus" "movetoworkspace, 4" \
    "<b>super</b>-<b>shift</b>-<b>5</b>" "Move app to workspace 5 and switch focus" "movetoworkspace, 5" \
    "<b>super</b>-<b>shift</b>-<b>6</b>" "Move app to workspace 6 and switch focus" "movetoworkspace, 6" \
    "<b>super</b>-<b>shift</b>-<b>7</b>" "Move app to workspace 7 and switch focus" "movetoworkspace, 7" \
    "<b>super</b>-<b>shift</b>-<b>8</b>" "Move app to workspace 8 and switch focus" "movetoworkspace, 8" \
    "<b>super</b>-<b>shift</b>-<b>9</b>" "Move app to workspace 9 and switch focus" "movetoworkspace, 9" \
    "<b>super</b>-<b>shift</b>-<b>0</b>" "Move app to workspace 10 and switch focus" "movetoworkspace, 10" \
    "<b>super</b>-<b>shift</b>-<b>[</b>" "Move to previous workspace and switch focus" "movetoworkspace, -1[" \
    "<b>super</b>-<b>shift</b>-<b>]</b>" "Move to next workspace and switch focus" "movetoworkspace, +1]" \
    "<b>super</b>-<b>ctrl</b>-<b>1</b>" "Move to workspace 1 without switching focus" "movetoworkspacesilent, 1" \
    "<b>super</b>-<b>ctrl</b>-<b>2</b>" "Move to workspace 2 without switching focus" "movetoworkspacesilent, 2" \
    "<b>super</b>-<b>ctrl</b>-<b>3</b>" "Move to workspace 3 without switching focus" "movetoworkspacesilent, 3" \
    "<b>super</b>-<b>ctrl</b>-<b>4</b>" "Move to workspace 4 without switching focus" "movetoworkspacesilent, 4" \
    "<b>super</b>-<b>ctrl</b>-<b>5</b>" "Move to workspace 5 without switching focus" "movetoworkspacesilent, 5" \
    "<b>super</b>-<b>ctrl</b>-<b>6</b>" "Move to workspace 6 without switching focus" "movetoworkspacesilent, 6" \
    "<b>super</b>-<b>ctrl</b>-<b>7</b>" "Move to workspace 7 without switching focus" "movetoworkspacesilent, 7" \
    "<b>super</b>-<b>ctrl</b>-<b>8</b>" "Move to workspace 8 without switching focus" "movetoworkspacesilent, 8" \
    "<b>super</b>-<b>ctrl</b>-<b>9</b>" "Move to workspace 9 without switching focus" "movetoworkspacesilent, 9" \
    "<b>super</b>-<b>ctrl</b>-<b>0</b>" "Move to workspace 10 without switching focus" "movetoworkspacesilent, 10" \
    "<b>super</b>-<b>ctrl</b>-<b>[</b>" "Move to previous workspace without switching focus" "movetoworkspacesilent, -1[" \
    "<b>super</b>-<b>ctrl</b>-<b>]</b>" "Move to next workspace without switching focus" "movetoworkspacesilent, +1]" \
    "<b>super</b>-<b>mouse_down</b>" "Go to previous workspace" "workspace, e+1" \
    "<b>super</b>-<b>mouse_up</b>" "Go to next workspace" "workspace, e-1" \
    "<b>super</b>-<b>period</b>" "Go to previous workspace" "workspace, e+1" \
    "<b>super</b>-<b>comma</b>" "Go to next workspace" "workspace, e-1" \
    "<b>super</b>-<b>ctrl</b>-<b>left</b>" "Move window left" "movewindow, l" \
    "<b>super</b>-<b>ctrl</b>-<b>right</b>" "Move window right" "movewindow, r" \
    "<b>super</b>-<b>ctrl</b>-<b>up</b>" "Move window up" "movewindow, u" \
    "<b>super</b>-<b>ctrl</b>-<b>down</b>" "Move window down" "movewindow, d" \
    "<b>super</b>-<b>alt</b>-<b>left</b>" "Swap window left" "swapwindow, l" \
    "<b>super</b>-<b>alt</b>-<b>right</b>" "Swap window right" "swapwindow, r" \
    "<b>super</b>-<b>alt</b>-<b>up</b>" "Swap window up" "swapwindow, u" \
    "<b>super</b>-<b>alt</b>-<b>down</b>" "Swap window down" "swapwindow, d" \
    "<b>super</b>-<b>left</b>" "Move focus left" "movefocus, l" \
    "<b>super</b>-<b>right</b>" "Move focus right" "movefocus, r" \
    "<b>super</b>-<b>up</b>" "Move focus up" "movefocus, u" \
    "<b>super</b>-<b>down</b>" "Move focus down" "movefocus, d" \
    "<b>super</b>-<b>tab</b>" "Go to next workspace on the same monitor" "workspace, m+1" \
    "<b>super</b>-<b>shift</b>-<b>tab</b>" "Go to previous workspace on the same monitor" "workspace, m-1" \
    "<b>super</b>-<b>shift</b>-<b>u</b>" "Move to special workspace (minimize)" "movetoworkspace, special" \
    "<b>super</b>-<b>u</b>" "Toggle special workspace (desktop)" "togglespecialworkspace," \
    "<b>super</b>-<b>g</b>" "Toggle group" "togglegroup" \
    "<b>super</b>-<b>ctrl</b>-<b>tab</b>" "Change active group" "changegroupactive" \
    "" "" "" \
    "Change binds: " "nvim ~/.config/hypr/conf/bind.conf" ""
