#!/usr/bin/env bash

set -e

EXTENSIONS=(
	"bungcip.better-toml" \
	"Prisma.prisma" \
	"ms-vscode-remote.remote-containers" \
	"enkia.tokyo-night" \
	"ms-azuretools.vscode-docker"
)

for EXTENSION in ${EXTENSIONS[@]}
do
	code --install-extension $EXTENSION --force
done

if [[ ! -L $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
	ln -s ~/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

