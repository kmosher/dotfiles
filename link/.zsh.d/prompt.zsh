autoload -U colors && colors

PROMPT="%{${fg[blue]}%}%B%n%b%{${fg[default]}%}@%{$fg[magenta]%}%B%m%b%{$fg[default]%}:%{$fg[yellow]%}%B%~%b%{$fg[default]%}%# "
RPROMPT="%{$fg[red]%}[%* on %D]%{$fg[default]%}"

# TODO: Redo as the zsh ternary syntax
if [ "$YELP_IN_SANDBOX" ]; then
    export PROMPT="$PROMPT (sandbox)\$ "
fi
