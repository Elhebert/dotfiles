# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$NVM_BIN:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure coreutils are loaded before system commands
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"
