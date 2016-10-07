ZSH=${ZDOTDIR:-$HOME}/.zsh.d/

# COMPLETION SETTINGS
# custom directory for completion scripts
fpath=(~/.zsh.d/completions $fpath)

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/kmosher/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

for config in $ZSH/*.zsh; do
    source $config
done

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
WORDCHARS='*?[]~&;!#$%^(){}<>'

# Duh
bindkey '^w' kill-region

# Push the current line onto the editing stack
bindkey '\eq' push-line-or-edit

# Pretty colors
export TERM=xterm-256color
# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
ZSH_HIGHLIGHT_STYLES[default]='fg=blue'
