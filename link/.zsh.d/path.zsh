# Prepend to $PATH
export GOPATH="$HOME/go"
path[1,0]=($HOME/.local/bin $GOPATH/bin $HOME/.emacs.d/bin/)
export PATH
