# Make only alphanum be considered parts of words
WORDCHARS=''

# Turn on typo correction of commands
setopt correct

# Set M-m to go backwards in history one word at a time
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word