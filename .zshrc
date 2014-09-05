# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -n $DISPLAY ]] then
    ZSH_THEME="agnoster"
else
    ZSH_THEME="gallois"
fi
DEFAULT_USER="halftan"

# Example aliases
alias zshconfig="gvim ~/.zshrc"
alias ohmyzsh="gvim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gitignore autojump rbenv bundler sudo)

if [[ -e ~/.pythonrc ]] then
    export PYTHONSTARTUP=~/.pythonrc
fi

if type vim &> /dev/null; then
    export EDITOR=vim
fi

alias open="xdg-open"
alias ll="ls -lh"
alias la="ls -lAh"
alias sl="ls"

ngvim() { gvim > /dev/null 2>&1 $@ }

if type npm &> /dev/null; then
    plugins=($plugins npm)
fi

if type pip &> /dev/null; then
    plugins=($plugins pip virtualenv)
    eval "$(pip completion --zsh)"
fi

source $ZSH/oh-my-zsh.sh

if type grunt &> /dev/null; then
    # Load grunt completion
    eval "$(grunt --completion=zsh)"
fi
