# ======= preferences =======
alias azurite='azurite --inMemoryPersistence --disableTelemetry' # clear storage on exit, no telemetry
alias cp='cp -iv'                                                # confirm overwrite, verbose
alias diff='zed --diff'                                          # use Zed instead of GNU diff
alias grep='grep --color=auto'                                   # color
alias less='less -R'                                             # enable colors
alias ls='ls -aCF --color=auto'                                  # hidden files, columns, suffixes, color
alias mv='mv -iv'                                                # confirm overwrite, verbose
alias wget='wget -c'                                             # resume download

# ======== shorthand ========
alias dotfiles='tmux new -A -s dotfiles -c $HOME/dotfiles'
alias randstr="tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10 | wl-copy"
alias src='source $HOME/.bashrc'
alias ts='sudo timeshift --create --comments "manual snapshot taken $(date +%F\ at\ %H:%M)"'

alias c='clear'
alias dot='dotfiles'
alias l='ls'
alias pn='pnpm'
alias tm='tmux'
# ======== functions ========
# usage: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# usage: `copy example.txt`
alias copy='wl-copy <'

# ======== completions ========
complete -F _complete_alias "${!BASH_ALIASES[@]}"

