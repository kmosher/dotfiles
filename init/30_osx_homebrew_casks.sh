# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask keg and recipe are installed.
kegs=(caskroom/cask caskroom/drivers)
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
  colloquy
  disk-inventory-x
  dropbox
  firefox
  gfxcardstatus
  gimp
  google-chrome
  inkscape
  iterm2
  java
  keka
  keybase
  puppet-agent
  race-for-the-galaxy
  sketchup
  slack
  spotify
  steam
  stay
  torbrowser
  # SHA isn't validating. Trying out keka instead.
  #  the-unarchiver
  xquartz
  yubico-authenticator
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
