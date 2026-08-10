# ======= preferences =======
alias azurite='azurite --inMemoryPersistence --disableTelemetry' # clear storage on exit, no telemetry
alias cp='cp -iv'                                                # confirm overwrite, verbose
alias less='less -iRF'                                           # case-insensitive, ANSI colors, quit if one screen
alias ls='ls -aCF --color=auto'                                  # hidden files, columns, suffixes, color
alias mv='mv -iv'                                                # confirm overwrite, verbose

# ======== shorthand ========
alias c='clear'
alias l='ls'
alias pn='pnpm'
alias tm='tmux'
alias zed='zeditor'

# ======== oneliners ========
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

# KDE Connect
# USAGE: desktop example.txt
alias desktop='kdeconnect-cli -n $DESKTOP_NAME --share'
alias laptop='kdeconnect-cli -n $LAPTOP_NAME --share'

# ======= completions =======
complete -F _complete_alias "${!BASH_ALIASES[@]}"
