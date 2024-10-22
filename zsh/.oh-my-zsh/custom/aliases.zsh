# Aliases for ZSH

# Aliases for editing the .zshrc and .oh-my-zsh files
alias zshrc="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
# Vim aliases
alias vim="nvim"
# Navigation and listing aliases
alias ..='cd ..'
alias cd..="cd .."
alias ..='cd ..'
alias ...='cd ../..'
alias dir='ls -l'
alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls="eza"
alias ll="eza -lh --icons=auto"
alias la="eza -lah --icons=auto --group-directories-first"
alias ldot="eza -ld --group-directories-first .*"
alias unmount='echo "Error: Try the command: umount" 1>&2; false'
# Zypper aliases
alias zh="zypper -h"
alias zinfo="zypper info --requires --recommends"
alias zdup="sudo zypper ref && sudo zypper dup -y"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm --clean-deps"
alias zse="zypper se"
alias zref="sudo zypper ref"
# Updating the flatpak packages
alias fupd="flatpak update --user -y"
# Clearing the terminal
alias cls="clear"

alias cat="bat"

alias dd="dd bs=4M status=progress"

alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"

