# PHPUNIT
alias puf="phpunit --filter"

# LS
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -laF"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="command ls -G"
else
	alias ls="command ls --color"
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

# Shrug
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias fliptable="echo '(╯°□°）╯︵ ┻━┻' | pbcopy"

# Reload
alias reloadcli="source $HOME/.zshrc"
alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Improved WHOIS
alias whois="whois -h whois-servers.net"

# Filesize
alias fs="stat -f \"%z bytes\""

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Config
alias dotfiles="code $DOTFILES"
alias sshconfig="code $HOME/.ssh"

# Docker
alias dockermysql="docker run --name mysql --rm -p 3306:3306 -e \"MYSQL_USER=homestead\" -e \"MYSQL_PASSWORD=secret\" -e \"MYSQL_ROOT_PASSWORD=secret\" -e \"MYSQL_DATABASE=homestead\" mysql:5.7"
alias dockermaildev="docker run --name maildev --rm -p 25:25 -p 1080:80 djfarrelly/maildev"
