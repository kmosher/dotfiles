# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

PATH=/usr/local/bin:/usr/local/sbin:"$PATH":~/pebble-dev/arm-cs-tools/bin

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Other cool plugins
# ant -- who knows..
# battery -- good for the laptop
# brew -- once again for the lappy
# emoji-clock -- useless? yes. cute? also yes
# osx -- some cool stuff for the lappy again. Should make some vnc aliases


source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Make traps and options local to functions
setopt localoptions localtraps

# Remove compatability shim. Allow typeset -x w/o -g
setopt noglobalexport
# Let's me exit with ^d
setopt noignoreeof
# Disable ^s/^q in ZLE
setopt noflowcontrol

# Emacs!
bindkey -e

# Default word chars. Probably want to remove a bunch.
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Duh
bindkey '^w' kill-region

# Push the current line onto the editing stack
bindkey '\eq' push-line-or-edit
