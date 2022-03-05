#!/usr/bin/env bash

set -e

brew update

(cd ~/.dotfiles/homebrew && brew bundle)

brew upgrade

brew cleanup
