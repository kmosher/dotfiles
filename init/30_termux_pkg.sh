# Termux-only stuff. Abort if not Termux.
is_termux || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P pkg)" ]] && e_error "Couldn't find pkg binary" && return 1

# Homebrew recipes
pkgs=(
    #  cask  # This is Cask for Emacs, unrelated to homebrew
  coreutils
  curl
  emacs
  git
  htop
  jq
  man
  nodejs
  openssh
  openssl
  python
  silversearcher-ag
  termux-api
  # termux-exec will be needed before #!/usr works
  # Should be installed by default tho
  termux-exec
  tmux
  tree
  wget
  zsh
)

e_header "Installing packages"
pkg install --yes $pkgs

# Misc cleanup!

e_header "Making $PREFIX/bin/zsh your default shell"
chsh -s "$PREFIX/bin/zsh" >/dev/null 2>&1
e_arrow "Please exit and restart all your shells."
