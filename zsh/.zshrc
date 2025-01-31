# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
eval $(/usr/libexec/path_helper)

# Path to your oh-my-zsh installation.
export ZSH="/Users/aaryan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="philips" # set by `omz`

BULLETTRAIN_PROMPT_ORDER=(
    context
    dir
    git
)

BULLETTRAIN_GIT_EXTENDED=false
BULLETTRAIN_GIT_DIRTY=""
BULLETTRAIN_GIT_CLEAN=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    extract
    git
    z
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

DEFAULT_USER=""

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# shows the weather by running `weather'
weather() {
    if [[ -z "$1" ]]; then
        LOC="austin"
    else
        LOC="$1"
    fi
    curl "https://wttr.in/$LOC?m1"
}

# creates a new file that uses the competitive programming template
# with the name that is provided
mkcp() {
    if ! test -f $1; then
        cp ~/competitive_programming/template.cpp $1 
    fi
    nvim $1
}

# colorful ls
alias ls='ls -G'

# java compiler and interpreter
alias j='java'
alias jc='javac'

# add pip install stuff
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin
PATH=$PATH:/Users/aaryan/Library/Python/3.10/bin

# make C and C++ compiler gcc and g++
alias gcc='gcc-14'
alias g++='g++-14 -Wall -std=c++17'

# python aliases
alias python3='python3.10'
alias pip3='pip3.10'
alias py2='python'
alias py3='python3'

# set default editor
export EDITOR=nvim

# golang variables
export GOPATH=$HOME/go
export GOROOT="/usr/local/opt/go/libexec"
export GOBIN=$GOPATH/bin
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# set up nvm
export NVM_DIR=~/.nvm

# google cloud 
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

nvm() {
    echo "Loading nvm..."
    source $(brew --prefix nvm)/nvm.sh
    nvm "$@"
}

# set up java version commands

java8() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    echo "Java is now version 8."
}

java11() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 11)
    echo "Java is now version 11."
}

java14() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 14)
    echo "Java is now version 14."
}

# opam configuration
[[ ! -r /Users/aaryan/.opam/opam-init/init.zsh ]] || source /Users/aaryan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# deletes non-tex files
# prints them all for confirmation
clean_tex() {
    echo "This command will delete:"
    find . -type f -not -name '*.tex' -o -not -name '*.sty' -o -not -name '*.png'
    if read -q "?continue? "; then
        find . -type f -not -name '*.tex' -o -not -name '*.sty' -o -not -name '*.png' -delete
    fi
}

# sketch
export PATH="$PATH:/Users/aaryan/Projects/research/sketch-1.7.5/sketch-frontend"
export SKETCH_HOME="/Users/aaryan/Projects/research/sketch-1.7.5/sketch-frontend/runtime"

# research
export PATH="$PATH:/Users/aaryan/Projects/research/"

# increase history size
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY

mvosu() {
    mv ~/Downloads/*.osz /Applications/osu\!.app/drive_c/osu\!/Songs/
}

export DOTNET_CLI_TELEMETRY_OPTOUT=1

run() {
    ok=1
    if [[ ! -f $1 || $1 -ot $1.cpp ]]; then
        clang++ $1.cpp -O2 -o $1 -Wall -std=c++17 -Wextra -Wshadow -fsanitize=undefined,address|| ok=0
    fi
    [[ $ok -eq 1 ]] && ./$1
}

# alias ld=mold
# export PATH=/Users/aaryan/bin:$PATH

alias emacs='emacs -nw'

# pyenv
export PATH="$(pyenv root)/shims:$PATH"
