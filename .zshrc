# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/go/libexec/bin:$HOME/bin:/usr/local/sbin

# Load antigen
ANTIGEN_PATH=''
if [[ -f  /usr/local/share/antigen/antigen.zsh ]]; then
    ANTIGEN_PATH="/usr/local/share/antigen/antigen.zsh"
elif [[ -f /usr/share/antigen/share/antigen.zsh ]]; then
    ANTIGEN_PATH="/usr/share/antigen/share/antigen.zsh"
elif [[ -f $HOME/.antigen.zsh ]]; then
    ANTIGEN_PATH="$HOME/.antigen.zsh"
fi

if [[ -n "$ANTIGEN_PATH" ]]; then
    source "$ANTIGEN_PATH"
    antigen init ~/.antigenrc
fi

if [ $commands[nvim] ]; then
    export EDITOR=nvim
elif [ $commands[vim] ]; then
    export EDITOR=vim
fi

export LANG="en_US.UTF-8"
export LESS=-Ri
export NODE_EXTRA_CA_CERTS="/usr/local/etc/openssl@1.1/cert.pem"
export SSL_CERT_FILE="/usr/local/etc/openssl@1.1/cert.pem"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# if [[ -n $DISPLAY ]] || [[ $VENDOR = "apple" ]] then
#     ZSH_THEME="ys"
# else
#     ZSH_THEME="gallois"
# fi
DEFAULT_USER="halftan"

# Example aliases
alias zshconfig="${EDITOR} ~/.zshrc"
# alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
# export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

function pyenv_prompt_info() {
    echo "$(pyenv version-name)"
}

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --vimgrep -g !.git'

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

if [[ $commands[go] ]]; then
    export GOBIN=$HOME/goworkspace/bin
    export GOPATH=$HOME/goworkspace
    export GOROOT=`go env GOROOT`
    PATH=$GOBIN:$PATH
fi

if [ $commands[sw_vers] ]; then
    # Mac OS X
    export JAVA_HOME=$(/usr/libexec/java_home)
    export ON_MAC_OS=1
    # export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    # PATH="$(brew --prefix vim)/bin:$PATH"
else
    # Linux
    ngvim() { gvim > /dev/null 2>&1 $@ }
    # plugins=($plugins systemd)
fi

if [[ -e ~/.zsh_alias ]]; then
    . ~/.zsh_alias
fi

if [[ $ON_MAC_OS ]]; then
    # LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
    # if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
    #     . $LUNCHY_DIR/lunchy-completion.zsh
    # fi
    if [[ -e /usr/local/opt/coreutils ]]; then
        PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
        # unalias ls
        alias ls="ls --color=auto"
        alias find="gfind"
        alias xargs="gxargs"
        alias locate="glocate"
    fi

    if [ $commands[gtar] ]; then
        alias tar="gtar"
    fi
else
    if [ $commands[yarn] ]; then
        PATH=$(yarn global bin):$PATH
    fi
fi

if [[ -e "$HOME/.emacs.d" ]]; then
    PATH="$HOME/.emacs.d/bin":$PATH
fi

# oc
if [[ -e "$HOME/.crc/bin/oc" ]]; then
    PATH="/Users/fengmzhang/.crc/bin/oc:$PATH"
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [[ -e "$HOME/.terminfo" ]]; then
    export TERM=xterm-24bits
fi
export -U PATH
export -U MANPATH

# export KUBECONFIG=$HOME/.kube/oneconfig.yaml

autoload -U +X bashcompinit && bashcompinit

# complete -o nospace -F /Users/andy.zhang/bin/aliyun aliyun

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fengmzhang/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fengmzhang/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fengmzhang/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fengmzhang/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

