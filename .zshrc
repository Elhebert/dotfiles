# ***************************************
# OH-MY-ZSH
# ***************************************
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="avit"
plugins=(git, tmux)
source $ZSH/oh-my-zsh.sh

# ***************************************
# MISC
# ***************************************
export REPORTTIME=10 # display how long all tasks over 10 seconds take

[[ -e ~/.terminfo  ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo

export EDITOR=/usr/bin/vim

# ***************************************
# PATH
# ***************************************
export PATH="/usr/local/bin:$PATH:`yarn global bin`"

if [[ -d /usr/local/sbin  ]]; then
    export PATH=/usr/local/sbin:$PATH
fi

if [[ -d ~/.dotfiles/bin  ]]; then
    export PATH=~/.dotfiles/bin:$PATH
fi

if [[ -d ~/bin  ]]; then
    export PATH=~/bin:$PATH
fi

if [[ -d ~/app/composer ]]; then
	export PATH=~/app/composer:$PATH
fi

# ***************************************
# TMUX
# ***************************************
export TERM=xterm-256color
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=true

# ***************************************
# NVM
# ***************************************
export NVM_DIR=~/app/nvm
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"
nvm use node

# **************************************
# ALIASES
# **************************************
alias composer='php ~/app/composer/composer'
