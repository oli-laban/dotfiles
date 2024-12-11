#!/bin/bash

################################################################################
### Configure macOS's helpful UserDefaults (aka simply `defaults`)
################################################################################

set -e # Immediately rethrows exceptions
set -x # Logs every command on Terminal

################################################################################
# Script Setup                                                                 #
################################################################################

# Close any open instances of the following programs, to prevent them from
# overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
osascript -e 'tell app "Xcode" to quit'
osascript -e 'tell app "TextEdit" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################################################
# Misc User Experience                                                         #
################################################################################

# When clicking scroll indicator, navigate to the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -bool true

# Maximizes the application upon double clicking its navigation bar
defaults write -g AppleActionOnDoubleClick -string "Maximize"

# Set the macOS interface style to Dark
defaults write -g AppleInterfaceStyle -string "Dark"

# Plays sound feedback when volume is changed
defaults write -g com.apple.sound.beep.feedback -int 1

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

################################################################################
# Keyboard                                                                     #
################################################################################

# Disable automatic capitalization as it’s annoying when typing code
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disables automatic text completion
defaults write -g NSAutomaticTextCompletionEnabled -bool false

# Set a blazingly fast keyboard repeat rate (even faster than max values via UI)
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# Enable press and hold for all keys. Requires a reboot to take affect.
defaults write -g ApplePressAndHoldEnabled -bool false

# Add keyboard shortcut `⌘ + option + right` to show the next tab, globally.
defaults write -g NSUserKeyEquivalents -dict-add "Show Next Tab" "@~\\U2192"

# Add keyboard shortcut `⌘ + option + left` to show the previous tab, globally.
defaults write -g NSUserKeyEquivalents -dict-add "Show Previous Tab" "@~\\U2190"

# Swap fn key behaviour (default to F1, F2 etc.)
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

################################################################################
# Spotlight                                                                    #
################################################################################

# Move the spotlight bar to the top right corner of the screen
#defaults write com.apple.Spotlight lastWindowPosition -string "{{984, 950}, {680, 52}}"
#defaults write com.apple.Spotlight userHasMovedWindow -bool true
# Skip showing the "learn more" tutorial
defaults write com.apple.Spotlight showedLearnMore -bool true

################################################################################
# Trackpad                                                                     #
################################################################################

# Set the pointer tracking speed when using a trackpad. Value ranges from 0 to 3
defaults write -g com.apple.trackpad.scaling -float 2.5

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# wvous-tl-corner: Top Left corner
# wvous-tr-corner: Top Right corner
# wvous-bl-corner: Bottom Left corner
# wvous-br-corner: Bottom Right corner

# Top right screen corner → Desktop
#defaults write com.apple.dock wvous-br-corner -int 4
#defaults write com.apple.dock wvous-br-modifier -int 0

################################################################################
# Language & Region                                                            #
################################################################################

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write -g AppleLanguages -array "en-GB"
defaults write -g AppleLocale -string "en_GB@currency=GBP"
defaults write -g AppleMeasurementUnits -string "Centimeters"
defaults write -g AppleMetricUnits -bool true

# Set the default temperature unit to Celsius
defaults write -g AppleTemperatureUnit -string "Celsius"

# Set the default hour format to use the 24-hour format
defaults write -g AppleICUForce24HourTime -bool true

# Hide language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool false

################################################################################
# Power Management                                                             #
################################################################################

# Set machine sleep to X minutes while charging. Set 0 for "never"
sudo pmset -c sleep 0

# Set machine sleep to X minutes on battery. Set 0 for "never"
sudo pmset -b sleep 10

# Disable proximity wake on all scenarios. This should save some battery
sudo pmset -a proximitywake 0

# Disable power nap
sudo pmset -a powernap 0

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

################################################################################
# Screenshots                                                                  #
################################################################################

# Create a Screenshots folder inside Pictures, if needed
mkdir -p ~/Pictures/Screenshots
# Save screenshots in the given folder
defaults write com.apple.screencapture location -string "~/Pictures/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Set shadows in screenshots as disabled
defaults write com.apple.screencapture disable-shadow -bool false

################################################################################
# Finder                                                                       #
################################################################################

# Set Desktop as the default location for new Finder windows
# For Desktop, use `PfDe` and `file://${HOME}/Desktop/`
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Whether icons for HDD, servers, and removable media should show on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: hide path bar
defaults write com.apple.finder ShowPathbar -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 128" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

################################################################################
# Dock                                                                         #
################################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Customize the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 62

# Set the large size of Dock items when over magnification effect
defaults write com.apple.dock largesize -float 76

# Enable magnification of the Dock
defaults write com.apple.dock magnification -bool false

# Enable the animation to minimize the application to the app icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Changes the orientation of the Dock
defaults write com.apple.dock orientation -string "bottom"

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Don’t automatically rearrange Spaces based on most recent use, as this shuffles the Spaces unexpectedly
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

################################################################################
# Terminal                                                                     #
################################################################################

# Enable Secure Keyboard Entry in Terminal.app. Secure keyboard entry can
# prevent other apps on your computer or the network from detecting and
# recording what you type in Terminal.
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.Terminal SecureKeyboardEntry -bool true

################################################################################
# TextEdit                                                                     #
################################################################################

# Set the author for the produced documents
defaults write com.apple.TextEdit author -string "Oli Laban"

# Whether TextEdit will produce rich text documents
defaults write com.apple.TextEdit RichText -int 0

# Whether TextEdit will use smart copy and paste
defaults write com.apple.TextEdit SmartCopyPaste -bool false

################################################################################
# App Store                                                                    #
################################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Turn off app auto-update
defaults write com.apple.commerce AutoUpdate -bool false

################################################################################
# Photos                                                                       #
################################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

################################################################################
# Finish                                                                       #
################################################################################

echo "Done. Please reboot your system for the changes to take effect."
