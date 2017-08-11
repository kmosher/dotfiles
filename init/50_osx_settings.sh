is_osx || return 1

echo "Turning off natural scroll"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Turning off random cursor magnification"
defaults write ~/Library/Preferences/.GlobalPreferences.plist CGDisableCursorLocationMagnification -bool YES

echo "Setting the top hot-corners to activate the screensaver"
defaults write ~/Library/Preferences/com.apple.dock wvous-tr-corner -int 5
defaults write ~/Library/Preferences/com.apple.dock wvous-tr-modifier -int 1
defaults write ~/Library/Preferences/com.apple.dock wvous-tl-corner -int 5
defaults write ~/Library/Preferences/com.apple.dock wvous-tl-modifier -int 1

mkdir -p ~/Library/KeyBindings/
ln -v "$DOTFILES/conf/osx/Library/KeyBindings/DefaultKeyBinding.dict" ~/Library/KeyBindings

ln -v "$DOTFILES/conf/osx/Library/LaunchAgents/org.homebrew.ssh-agent.plist" ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/org.homebrew.ssh-agent.plist

echo "Logout and login for OSX settings to take effect"
