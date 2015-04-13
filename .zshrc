# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if type vim &> /dev/null; then
    export EDITOR=vim
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -n $DISPLAY ]] || [[ $VENDOR = "apple" ]] then
    ZSH_THEME="muse"
else
    ZSH_THEME="gallois"
fi
DEFAULT_USER="halftan"

# Example aliases
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

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
# export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:/usr/local/sbin:$PATH

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract gitignore sudo history history-substring-search\
    autojump composer rbenv bundler )

if [[ -e ~/.pythonrc ]] then
    export PYTHONSTARTUP=~/.pythonrc
fi

if type sw_vers &> /dev/null; then
    # Mac OS X
    plugins=($plugins brew)
else
    # Linux
    alias open="xdg-open"
    ngvim() { gvim > /dev/null 2>&1 $@ }
fi
alias ll="ls -lh"
alias la="ls -lAh"
alias sl="ls"
alias glglr="git log --oneline --graph --left-right"

if type ag &> /dev/null
then
    alias psg="ps aux|ag"
else
    alias psg="ps aux|grep -i"
fi

if type npm &> /dev/null; then
    plugins=($plugins npm)
fi

if type pip &> /dev/null; then
    plugins=($plugins pip virtualenv)
    eval "$(pip completion --zsh)"
fi

if type grunt &> /dev/null; then
    # Load grunt completion
    eval "$(grunt --completion=zsh)"
fi

if [[ -e ~/.zsh_alias ]]; then
    . ~/.zsh_alias
fi

source $ZSH/oh-my-zsh.sh

