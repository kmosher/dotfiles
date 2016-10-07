# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask keg and recipe are installed.
kegs=(caskroom/cask)
brew_tap_kegs

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Homebrew casks
casks=(
  # Applications
  adium
  alfred
  alinof-timer
  aquamacs
  battle-net
  colloquy
  disk-inventory-x
  docker
  dropbox
  firefox
  gfxcardstatus
  gimp
  gist
  google-chrome
  google-photos-backup
  hipchat
  inkscape
  iterm2
  java
  kitematic
  mumble
  puppet-agent
  skype
  slack
  spotify
  steam
  stay
  terraform
  the-unarchiver
  torbrowser
  tunnelblick
  xquartz
  yubico-authenticator
  yubikey-personalization-gui
  vagrant
  virtualbox
  vlc
  wireshark
)

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
  brew cask cleanup
fi
