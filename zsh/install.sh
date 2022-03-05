#!/usr/bin/env bash

set -e

if [[ -d ~/.oh-my-zsh ]];
then
    $ZSH/tools/upgrade.sh
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rm ~/.zshrc && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
