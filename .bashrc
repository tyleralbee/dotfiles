#!/usr/bin/env bash
#
# Bash configuration
#
# Author: Tyler Albee <tyleralbee25@gmail.com>
# References:
# - https://github.com/bahamas10/dotfiles/blob/5953977037bf387e796ea28bad88dff68e73c777/bashrc

# If not running interactively, don't do anything
[[ -n $PS1 ]] || return

## Shell configuration
export HISTFILE="$XDG_STATE_HOME/${SHELL##*/}/history"
export HISTFILESIZE=10000
export HISTSIZE=10000

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

# Application configuration
export BASH_COMPLETION_USER_DIR="$XDG_DATA_HOME/bash-completion"

## Sources
. ~/.bash_prompt    2>/dev/null || true
. ~/.complete_alias 2>/dev/null || true
. ~/.bash_functions 2>/dev/null || true
. ~/.bash_aliases   2>/dev/null || true
. ~/.bashrc.local   2>/dev/null || true

# https://direnv.net/docs/hook.html#bash
eval "$(direnv hook bash)"
