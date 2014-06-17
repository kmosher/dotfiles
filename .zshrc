# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# More customization

# Make traps and options local to functions
setopt localoptions localtraps

# Remove compatability shim. Allow typeset -x w/o -g
setopt noglobalexport

# Lets me exit with ^d
setopt noignoreeof

# Disable ^s/^q in ZLE
setopt noflowcontrol

# Emacs!
bindkey -e

# Default word chars. Probably want to remove a bunch.
# WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Duh
bindkey '^w' kill-region

# Push the current line onto the editing stack
bindkey '\eq' push-line-or-edit
