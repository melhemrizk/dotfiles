########  ######  ##     ##     ######  ##     ## ######## ##       ##
     ##  ##    ## ##     ##    ##    ## ##     ## ##       ##       ##
    ##   ##       ##     ##    ##       ##     ## ##       ##       ##
   ##     ######  #########     ######  ######### ######   ##       ##
  ##           ## ##     ##          ## ##     ## ##       ##       ##
 ##      ##    ## ##     ##    ##    ## ##     ## ##       ##       ##
########  ######  ##     ##     ######  ##     ## ######## ######## ########

#            _      _____           _____ ______  _____
#      /\   | |    |_   _|   /\    / ____|  ____|/ ____|
#     /  \  | |      | |    /  \  | (___ | |__  | (___
#    / /\ \ | |      | |   / /\ \  \___ \|  __|  \___ \
#   / ____ \| |____ _| |_ / ____ \ ____) | |____ ____) |
#  /_/    \_\______|_____/_/    \_\_____/|______|_____/
#

# -----------
# | General |
# -----------

alias grep="grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls="eza"
alias ll="eza -lh --icons=auto"
alias la="eza -lah --icons=auto --group-directories-first"
alias ldot="eza -ld --group-directories-first .*"
alias unmount='echo "Error: Try the command: umount" 1>&2; false'
alias ..='cd ..'
alias cd..="cd .."
alias ..='cd ..'
alias ...='cd ../..'
alias dir='ls -l'
alias cls="clear"
alias cat="bat"
alias dd="dd bs=4M status=progress"
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"

# -------
# | ZSH |
# -------

alias zshrc="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"

# -----------
# | Editors |
# -----------

alias vim="nvim"
alias e="emacs"

# ----------
# | Zypper |
# ----------

alias zh="zypper -h"
alias zinfo="zypper info --requires --recommends"
alias zdup="sudo zypper ref && sudo zypper dup -y"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm --clean-deps"
alias zse="zypper se"
alias zref="sudo zypper ref"

# ------------
# | Flatpaks |
# ------------

alias fupd="flatpak update --user -y"
alias fin="flatpak install --user"

# -------
# | Git |
# -------

alias gst="git status"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gp="git push"

# ------
# | GO |
# ------

alias gor="go run"
alias gomt="go mod tidy"
alias gob="go build"
alias gof="go fmt"
alias goi="go install"
