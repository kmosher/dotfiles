ZSH=${ZDOTDIR:-$HOME}/.zsh.d/

# COMPLETION SETTINGS
# custom directory for completion scripts
fpath=(~/.zsh.d/completions $fpath)

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/kmosher/.zshrc'

# Only regenerate completion cache once a day:
# https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2158147
autoload -Uz compinit
re_initialize=0
for match in $zcompdump*(.Nmh+24); do
  re_initialize=1
  break
done

if [ "$re_initialized" -eq "1" ]; then
    compinit
    # update the timestamp on compdump file
    compdump
else
    # omit the check for new functions since we updated today
    compinit -C
fi

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

# For some reason I need this to make the DEL key work(???)
bindkey "^[[3~" delete-char


if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
  ZSH_HIGHLIGHT_STYLES[default]='fg=blue'
elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
  ZSH_HIGHLIGHT_STYLES[default]='fg=blue'
elif [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
  ZSH_HIGHLIGHT_STYLES[default]='fg=blue'
fi

source ~/.zsh-nvm/zsh-nvm.plugin.zsh
# export NVM_DIR="$HOME/.nvm"
#     [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
#     [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
