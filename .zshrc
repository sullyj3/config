# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
export EDITOR="vim"
#export WORKON_HOME=$HOME/.virtualenvs
export TODOTXT_DEFAULT_ACTION=ls

#source /usr/bin/virtualenvwrapper.sh
#source /etc/profile.d/autojump.zsh
source todo_completion

bindkey -v
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

unset SSH_ASKPASS #for git no popup password prompt
precmd() { print "" }

#[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null
#if [ "$TMUX" = "" ]; then tmux; fi

path+=$HOME/android-sdk-linux/platform-tools
path+=$HOME/android-sdk-linux/tools
path+=$HOME/android-sdk-linux/build-tools

eval "$(fasd --init auto)"
