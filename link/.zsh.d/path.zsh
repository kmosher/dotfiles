# Prepend to $PATH
export GOPATH="$HOME/go"
path[1,0]=($HOME/.nvm/versions/node/v18.6.0/bin $HOME/.local/bin $HOME/.dotfiles/bin $GOPATH/bin $HOME/.emacs.d/bin/)
export PATH

