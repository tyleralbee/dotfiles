# ======= preferences =======
alias cp='cp -iv'                           # confirm overwrite, verbose
alias grep='grep --color=auto'              # color
alias ls='ls -aCF --color=auto'             # hidden files, columns, suffixes, color
alias mv='mv -iv'                           # confirm overwrite, verbose
alias wget='wget -c'                        # resume download
alias zed='zed --wait'

# ======== shorthand ========
alias c='clear'
alias copy='wl-copy <' # Copy file to clipboard ('copy example.txt')
alias dotfiles='tmux new-session -A -s dotfiles -c ~/dotfiles'
alias l='ls'
alias pn='pnpm'
alias src='source ~/.bashrc'
alias tm='tmux'
alias ts='sudo -E timeshift-gtk'
alias vim='nvim'

# ======== functions ========
# Alert after long running commands ('sleep 10; alert')
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ======== hyprland =========
alias hypr='$EDITOR $HOME/.config/hypr/hyprland.conf'
alias hyprbinds='$EDITOR $HOME/.config/hypr/UserConfigs/UserKeybinds.conf'
alias hyprsettings='$EDITOR $HOME/.config/hypr/UserConfigs/UserSettings.conf'

# ======== obsidian =========
alias obsidian-personal='tmux new-session -A -s obsidian-personal -c $OBSIDIAN_VAULT_PERSONAL'
alias obsidian-work='tmux new-session -A -s obsidian-work -c $OBSIDIAN_VAULT_WORK'
alias obsidian='obsidian-personal'

