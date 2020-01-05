# Bail out for non interactive shells
if [ -z "$PS1" ]; then
   return
fi

# Set preferred command line mode
set -o vi

# Some useful aliases
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias grep='grep --color=auto'
alias less='less -FSRXck ~/.less'
alias vim=gvim

# Make sure any editor is vim
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Capture more history
export HISTSIZE=1000
export HISTIGNORE="history:jump"
