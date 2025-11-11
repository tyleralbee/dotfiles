#!/usr/bin/env bash
#
# List running windows, select one to focus it
set -euo pipefail

choice="$(
    hyprctl -j clients \
        | jq -r '
      map(select(.mapped and (.hidden|not)))
      | map({addr:.address, ws:(.workspace.id|tostring),
             title:(.initialTitle // .title // .class // "untitled")})
      | unique_by(.addr)
      | map("\(.title)\tws:\(.ws)\t\(.addr)")
      | .[]' \
        | fuzzel --dmenu --with-nth 1

)"

[ -z "${choice:-}" ] && exit 0
addr="$(printf '%s' "$choice" | awk -F'\t' '{print $3}')"
[ -n "$addr" ] && hyprctl dispatch focuswindow "address:$addr"
