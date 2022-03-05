#!/usr/bin/env bash

set -e

####################
# Helper functions #
####################

dock_item() {
	printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>', "$1"
}

############
# Settings #
############

# Dock
defaults write com.apple.dock persistent-apps -array \
	"$(dock_item /System/Applications/Facetime.app)" \
	"$(dock_item /System/Applications/Calendar.app)" \
	"$(dock_item /Applications/Spark.app)" \
	"$(dock_item /Applications/Slack.app)" \
	"$(dock_item /Applications/Brave\ Browser.app)"

defaults write com.apple.dock persistent-others -array "$(dock_item ~/Downloads)"

defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock autohide -bool true

defaults write com.apple.dock mineffect -string "scale"

defaults write com.apple.dock "mru-spaces" -bool false

# Keyboard
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Screenshots
mkdir -p "$HOME/Documents/screenshots"
defaults write com.apple.screencapture location -string "$HOME/Documents/screenshots"

################
# Restart apps #
################

apps=(
	Dock
)

for app in "${apps[@]}"
do
	killall "$app"
done

