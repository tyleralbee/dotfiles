# ======= preferences =======
alias cp='cp -iv'                           # confirm overwrite, verbose
alias grep='grep --color=auto'              # color
alias ls='ls -aCF --color=auto'             # hidden files, columns, suffixes, color
alias mv='mv -iv'                           # confirm overwrite, verbose
alias wget='wget -c'                        # resume download

# ======== shorthand ========
alias c='clear'
alias l='ls'
alias pn='pnpm'
alias src='source ~/.bashrc'
alias ts='sudo -E timeshift-gtk'

# ======== functions ========
# Alert after long running commands ('sleep 10; alert')
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Copy file to clipboard ('copy example.txt')
function copy() { xclip -sel c < "$@"; }

