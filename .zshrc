# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ys"

# User configuration
source $ZSH/oh-my-zsh.sh

alias node-dev='NODE_ENV=development NODE_TLS_REJECT_UNAUTHORIZED=0 node'
alias fuck='thefuck'

export NPM_PACKAGES="$HOME/app/npm"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$NPM_PACKAGES/bin"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
