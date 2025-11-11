#!/usr/bin/env bash
#
# Shell-agnostic environment variables and settings
#
# Author: Tyler Albee <tyleralbee25@gmail.com>
# Notes:
# - xdg-ninja can find files that don't follow XDG Base Directory Specification
# Dependencies:
# - bat: cat replacement with syntax highlighting and Git integration
# - cheat: quick reference cheat sheet tool
# - firefox: web browser
# - fzf: command-line fuzzy finder
# - ghostty: terminal emulator
# - grim: screenshot utility
# - less: terminal pager program
# - node: Node.js runtime
# - nvim (neovim): terminal-based text editor
# - pnpm: Node.js package manager
# - rg (ripgrep): line-oriented search tool
# - zathura: document viewer
# - zeditor (Zed IDE): graphical text editor
# References:
# - https://github.com/hardfau1t/dotfiles/blob/d080199e148d7e37aa067ad4a142df3dc77e9041/homemanager-modules/configs/bash/.bash_profile

## XDG Base Directories

### User directories - https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
#### XDG_RUNTIME_DIR is set by pam_systemd to /run/user/$UID

### System directories - https://wiki.archlinux.org/title/XDG_Base_Directory#System_directories
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

## PATH configuration
case ":$PATH:" in
  *":$HOME/.local/bin:"*) : ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) : ;;
  *) PATH="$PNPM_HOME:$PATH" ;;
esac

## Default programs
export BROWSER=firefox
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export PAGER=less
export READER=zathura
export SYSTEMD_EDITOR=nvim
export TERMINAL=ghostty
export VISUAL=zeditor

## Application configuration
export CHEAT_CONFIG_PATH="$XDG_CONFIG_HOME/cheat/conf.yml"
export CHEAT_USE_FZF=true
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots/"
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
