# ======= preferences =======
alias azurite='azurite --inMemoryPersistence --disableTelemetry' # clear storage on exit, no telemetry
alias cp='cp -iv'                                                # confirm overwrite, verbose
alias grep='grep --color=auto'                                   # color
alias less='less -iRF'                                           # case-insensitive, ANSI colors, quit if one screen
alias ls='ls -aCF --color=auto'                                  # hidden files, columns, suffixes, color
alias mv='mv -iv'                                                # confirm overwrite, verbose
alias wget='wget -c'                                             # resume download

# ======== shorthand ========
alias act='gh act'
alias c='clear'
alias l='ls'
alias pn='pnpm'
alias tm='tmux'
alias zed='zeditor'

# ======== oneliners ========
alias dot='tmux new -A -s dotfiles -c $STOW_DIR'
alias randstr="tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10 | wl-copy"
alias src='source $HOME/.bashrc'
alias ts='sudo timeshift --create --comments "manual snapshot taken $(date +%F\ at\ %H:%M)"'
alias zed-log='tail -f $XDG_DATA_HOME/zed/logs/Zed.log'

# ======== functions ========
# Display an alert
# USAGE: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Copy file contents
# USAGE: copy example.txt
alias copy='wl-copy <'

# Create worktree, start Codex with optional prompt
# USAGE: wtsc fix/example -- 'Fix GH #123'
# https://worktrunk.dev/tips-patterns/#shell-alias-for-new-worktree-agent
alias wtsc='wt switch --create --execute=codex'

# ======= completions =======
complete -F _complete_alias "${!BASH_ALIASES[@]}"
