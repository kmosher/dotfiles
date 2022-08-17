# ls colors
autoload colors && colors;

if [ "$DISABLE_LS_COLORS" != "true" ]
then
export LSCOLORS="Gxfxcxdxbxegedabagacad"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  if whence dircolors >/dev/null; then
    eval $(dircolors -b $HOME/.zsh.d/dircolors)
    alias ls='ls --color'
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  else
    export CLICOLOR=1
    zstyle ':completion:*:default' list-colors ''
  fi
fi

# List direcory contents
alias lsa='ls -lah'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up
alias lart="ls -lArt"
