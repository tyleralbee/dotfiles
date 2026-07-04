#!/usr/bin/env bash
#
# Shell-agnostic environment variables and settings
#
# Author: Tyler Albee <tyleralbee25@gmail.com>
# 
# Tools configured:
# - pnpm: Add pnpm binaries to PATH
# - firefox: Default web browser
# - nvim: Default terminal/systemd editor
# - fzf: Use ripgrep for fuzzy find
# - man: Use bat for syntax highlighting
# - ghostty: Default terminal emulator
# - zed: Default visual editor
# - cheat: Cheatsheet CLI configuration
# - grim: Wayland screenshots directory
# - node: Node.js REPL history file
# - supabase: Telemetry opt-out
# - azure-functions-core-tools: Telemetry opt-out
# - turbo: Telemetry opt-out
# - kdeconnect-cli: Device identifiers
# 
# References:
# - https://github.com/hardfau1t/dotfiles/blob/d080199e148d7e37aa067ad4a142df3dc77e9041/homemanager-modules/configs/bash/.bash_profile

## XDG Base User Directories - https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
# XDG_RUNTIME_DIR is set by pam_systemd to /run/user/$UID

## XDG Base System Directories - https://wiki.archlinux.org/title/XDG_Base_Directory#System_directories
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

## XDG Non-Standard User Directories - https://wiki.archlinux.org/title/XDG_user_directories
export XDG_DESKTOP_DIR="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
export XDG_DOCUMENTS_DIR="${XDG_DOCUMENTS_DIR:-$HOME/Documents}"
export XDG_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"
export XDG_MUSIC_DIR="${XDG_MUSIC_DIR:-$HOME/Music}"
export XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"
export XDG_PUBLICSHARE_DIR="${XDG_PUBLICSHARE_DIR:-$HOME/Public}"
export XDG_TEMPLATES_DIR="${XDG_TEMPLATES_DIR:-$HOME/Templates}"
export XDG_VIDEOS_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}"

## PATH configuration, e.g. for pnpm binaries
case ":$PATH:" in
  *":$HOME/.local/bin:"*) : ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

## Default programs, e.g. for xdg-open
export BROWSER=firefox
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export PAGER=less
export SYSTEMD_EDITOR=nvim
export TERMINAL=ghostty
export VISUAL=zeditor

## Application configuration, e.g. for ripgrep
export CHEAT_CONFIG_PATH="$XDG_CONFIG_HOME/cheat/conf.yml"
export CHEAT_USE_FZF=true
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots/"
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

## Disable telemetry, e.g. in the Supabase CLI
export DO_NOT_TRACK=1                             # Generic opt-out
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1    # Azure Functions Core Tools
export TURBO_TELEMETRY_DISABLED=1                 # Turborepo (Vercel)

## Device identifiers, e.g. for KDE Connect
export DESKTOP_NAME="tyler-arch-20251001-desktop" # Arch PC
export LAPTOP_NAME="tyler-macos-26-laptop"        # MacOS Laptop
export MOBILE_NAME="tyler-ios-26-mobile"          # iOS iPhone
