########  ######  ##     ##     ######  ##     ## ######## ##       ##
     ##  ##    ## ##     ##    ##    ## ##     ## ##       ##       ##
    ##   ##       ##     ##    ##       ##     ## ##       ##       ##
   ##     ######  #########     ######  ######### ######   ##       ##
  ##           ## ##     ##          ## ##     ## ##       ##       ##
 ##      ##    ## ##     ##    ##    ## ##     ## ##       ##       ##
########  ######  ##     ##     ######  ##     ## ######## ######## ########

# --------------------------
# | ZSH configuration file |
# --------------------------

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/Monero:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Editor
export EDITOR=/usr/bin/emacs

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(golang command-not-found docker)

#Golang plugin aliases for reference
#gob 	go build 	Build your code
#goc 	go clean 	Removes object files from package source directories
#god 	go doc 	Prints documentation comments
#goe 	go env 	Prints Go environment information
#gof 	go fmt 	Gofmt formats (aligns and indents) Go programs.
#gofa 	go fmt ./... 	Run go fmt for all packages in current directory, recursively
#gofx 	go fix 	Update packages to use a new API
#gog 	go get 	Downloads packages and then installs them to $GOPATH
#goga 	go get ./... 	Installs all dependencies in current directory, recursively
#goi 	go install 	Compiles and installs packages to $GOPATH
#gol 	go list 	Lists Go packages
#gom 	go mod 	Access to operations on modules
#gomt 	go mod tidy 	Tidies up the go.mod file
#gopa 	cd $GOPATH 	Takes you to $GOPATH
#gopb 	cd $GOPATH/bin 	Takes you to $GOPATH/bin
#gops 	cd $GOPATH/src 	Takes you to $GOPATH/src
#gor 	go run 	Compiles and runs your code
#got 	go test 	Runs tests
#gota 	go test ./... 	Runs tests in all subdirectories
#goto 	go tool 	Prints all the available tools
#gotoc 	go tool compile 	Generates object file
#gotod 	go tool dist 	Utility to bootstrap, build and test go runtime
#gotofx 	go tool fix 	Fixes an application to use newer features
#gov 	go vet 	Vet examines Go source code and reports suspicious constructs
#gove 	go version 	Prints Go version
#gow 	go work 	Work provides access to operations on workspaces

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# -----------
# | History |
# -----------

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ---------
# | Conda |
# ---------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# -------------------
# | Starship prompt |
# -------------------

eval "$(starship init zsh)"

# ----------
# | Zoxide |
# ----------

eval "$(zoxide init --cmd cd zsh)"

# ------------------
# | fuzzy find FZF |
# ------------------

eval "$(fzf --zsh)"

# ---------------------------
# | ZSH syntax highlighting |
# ---------------------------

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


