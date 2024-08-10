# Aliases
alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vim="nvim"
alias cd..="cd .."
alias grep="grep --color=auto"
alias ll="eza -lh --icons=auto"
alias la="eza -lah --icons=auto --group-directories-first"
alias ldot="eza -ld --group-directories-first .*"
#Zypper aliases
alias zh="zypper -h"
alias zinfo="zypper info --requires --recommends"
alias zdup="sudo zypper ref && sudo zypper dup -y"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm --clean-deps"
alias zse="zypper se"
#Updating the flatpak packages
alias fupd="flatpak update --user -y"
#Clearing the terminal
alias cls="clear"

alias cat="bat"
