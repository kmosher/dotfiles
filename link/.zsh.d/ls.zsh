# ls colors
autoload colors && colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
eval $(dircolors -b $HOME/.zsh.d/dircolors)

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
    # Find the option for using colors in ls, depending on the version: Linux or BSD
    ls --color -d /dev/null &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

# List direcory contents
alias lsa='ls -lah'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up
alias lart="ls -lArt"
