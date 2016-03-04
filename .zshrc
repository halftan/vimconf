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
export PATH=/usr/local/opt/go/libexec/bin:$HOME/bin:/usr/local/sbin:$PATH
export MANPATH=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract gitignore sudo history history-substring-search\
    autojump composer rbenv bundler golang)

if [[ -e ~/.pythonrc ]] then
    export PYTHONSTARTUP=~/.pythonrc
fi

if type go &> /dev/null; then
    if [[ ! -d $HOME/goworkspace ]]; then
        mkdir $HOME/goworkspace
    fi
    export GOBIN=$HOME/goworkspace/bin
    export GOPATH=$HOME/goworkspace:$HOME/git/goprojects
    export PATH=$GOBIN:$PATH
fi

if type sw_vers &> /dev/null; then
    # Mac OS X
    export JAVA_HOME=$(/usr/libexec/java_home)
    # export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    plugins=($plugins brew)
else
    # Linux
    ngvim() { gvim > /dev/null 2>&1 $@ }
    plugins=($plugins systemd)
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

source $ZSH/oh-my-zsh.sh

if [[ -e ~/.zsh_alias ]]; then
    . ~/.zsh_alias
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if type thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type sw_vers &> /dev/null; then
    # Mac OS X settings
    if [[ -d /usr/local/opt/coreutils ]]; then
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
        alias ls="ls --color=auto"
    fi
fi

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
    . $LUNCHY_DIR/lunchy-completion.zsh
fi

export HOMEBREW_GITHUB_API_TOKEN="453581faa1baa382ad9f441fc6e872a7814573ce"
export TERM=xterm-256color
