#!/bin/bash

function run_preferences {
  # Automatically quit printer app once the print jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Disable “natural” (Lion-style) scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  # Show hidden files
  defaults write com.apple.finder AppleShowAllFiles YES

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  # defaults write com.apple.finder ShowPathbar -bool true

  # When performing a search, search the current folder by default
  # defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Enable swipe up for expose on Dock items.
  defaults write com.apple.dock scroll-to-open -bool true

  # Show hidden apps as translucent in the dock
  # defaults write com.apple.dock showhidden -bool true

  # Disable the warning before emptying the Trash
  defaults write com.apple.finder WarnOnEmptyTrash -bool false

  # Set the icon size of Dock items to 56 pixels
  defaults write com.apple.dock tilesize -int 56

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Kill affected apps
  killall Finder
  killall Dock
}

# If this preference isn't set, re-run everything
if [[ $(defaults read NSGlobalDomain com.apple.swipescrolldirection) -eq 1 ]]; then
  run_preferences
fi
