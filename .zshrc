# Path to your oh-my-zsh installation.
export ZSH=/Users/ben/.oh-my-zsh

# NVM configuration.
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

###

# Antigen configuration
source /Users/ben/Documents/terminal/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship


# Tell antigen that you're done.
antigen apply

####
