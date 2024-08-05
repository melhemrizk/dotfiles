# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

#Customizing the bash prompt

#bold=$(tput bold)
#user_color=$(tput setaf 202)
#host_color=$(tput setaf 118)
#dir_color=$(tput setaf 190)
#arrow_color=$(tput setaf 197)
#time_color=$(tput setaf 39)
#white=$(tput setaf 255)
#reset=$(tput sgr0)
#
#PS1="\[${bold}\]\n";
#PS1+="\[${user_color}\]★\u★ ";
#PS1+="\[${white}\]at ";
#PS1+="\[${host_color}\]★\h★ ";
#PS1+="\[${white}\]in ";
#PS1+="\[${dir_color}\]\W ";
#PS1+="\[${time_color}\]\A";
#PS1+="\[${arrow_color}\]\n❱ ";
#PS1+="\[${reset}\]";
#export PS1;

#Customizing the bash prompt with starship

eval "$(starship init bash)"


#Aliases

#alias '+'='pushd .'
alias -- -='popd'
alias ..='cd ..'
alias ...='cd ../..'
alias beep='echo -en "\007"'
alias cd..='cd ..'
alias dir='ls -l'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias l='ls -alF'
alias la='ls -lah'
alias ll='ls -l'
alias ls='_ls'
alias ls-l='ls -l'
alias md='mkdir -p'
alias o='less'
alias rd='rmdir'
alias rehash='hash -r'
alias unmount='echo "Error: Try the command: umount" 1>&2; false'
alias you='if test "$EUID" = 0 ; then /sbin/yast2 online_update ; else su - -c "/sbin/yast2 online_update" ; fi'

# Requesting info about a certain package
alias zinfo='zypper info --requires --recommends'
# Updating the system
alias upd='sudo zypper ref && sudo zypper dup -y'
# Updating the flatpk packages
alias upf='flatpak update --user -y'
# Clearing the terminal screen
alias cls='clear'

alias cat='bat'

alias ls='eza'
alias la='eza -lah'
alias l='eza -alF'
alias ll='eza -l'
alias ls-l='eza -l'
alias dir='eza -l'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(zoxide init --cmd cd bash)"
eval "$(fzf --bash)"


