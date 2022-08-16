# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask keg and recipe are installed.
kegs=()
brew_tap_kegs

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Homebrew casks
casks=(
  1password-cli
  alfred
#  alinof-timer
#  bartender
#  disk-inventory-x
#  dropbox
#  gfxcardstatus
  fantastical
  gimp
  # Using site install
  google-chrome
  inkscape
  iterm2
#  java
#  keka
#  keybase
#  oversight
#  race-for-the-galaxy
  slack
  spotify
#  steam
#  stay
  the-unarchiver
#  xquartz
#  yubico-authenticator
  visual-studio-code
  vlc
  wireshark
  zoom
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
