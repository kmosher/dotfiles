is_osx || return 1

mkdir -p ~/Library/KeyBindings/
ln -v "$DOTFILES/conf/osx/Library/KeyBindings/DefaultKeyBinding.dict" ~/Library/KeyBindings
