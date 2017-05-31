# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

if type vim &> /dev/null; then
    export EDITOR=vim
fi

export LANG="en_US.UTF-8"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -n $DISPLAY ]] || [[ $VENDOR = "apple" ]] then
    ZSH_THEME="ys"
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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
# export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
PATH=/usr/local/opt/go/libexec/bin:$HOME/bin:/usr/local/sbin:$PATH

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh_reload git extract sudo history history-substring-search composer autojump golang tig gitignore laravel5 npm pip)

export GOBIN=$HOME/goworkspace/bin
export GOPATH=$HOME/git/leafserver:$HOME/goworkspace:$HOME/git/goprojects
export GOROOT=`go env GOROOT`
PATH=$GOBIN:$PATH

if [[ -e /usr/bin/sw_vers ]]; then
    # Mac OS X
    export JAVA_HOME=$(/usr/libexec/java_home)
    export ON_MAC_OS=1
    # export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    plugins=($plugins brew)
    # PATH="$(brew --prefix vim)/bin:$PATH"

else
    # Linux
    ngvim() { gvim > /dev/null 2>&1 $@ }
    plugins=($plugins systemd)
fi

source $ZSH/oh-my-zsh.sh

if [[ -e ~/.zsh_alias ]]; then
    . ~/.zsh_alias
fi

if [[ $ON_MAC_OS ]]; then
    LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
    if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
        . $LUNCHY_DIR/lunchy-completion.zsh
    fi
    if [[ -e /usr/local/opt/coreutils ]]; then
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
        unalias ls
        alias ls="ls --color=auto"
        alias find="gfind"
        alias xargs="gxargs"
        alias locate="glocate"
    fi
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM=xterm-256color
export -U PATH
export -U MANPATH

if [[ -d $HOME/.pyenv ]]; then
    PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
fi

function pyenv_prompt_info() {
    echo "$(pyenv version-name)"
}

export HOMEBREW_NO_AUTO_UPDATE=1

