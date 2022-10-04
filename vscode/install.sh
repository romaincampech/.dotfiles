#!/usr/bin/env bash

set -e

EXTENSIONS=(
	"bungcip.better-toml" \
	"Prisma.prisma" \
	"ms-vscode-remote.remote-containers" \
	"enkia.tokyo-night" \
	"ms-azuretools.vscode-docker" \
	"ms-python.python" \
	"GrapeCity.gc-excelviewer" \
	"esbenp.prettier-vscode" \
	"GraphQL.vscode-graphql" \
	"dbaeumer.vscode-eslint" \
	"rvest.vs-code-prettier-eslint" \
	"wayou.vscode-todo-highlight" \
	"eamodio.gitlens" \
	"styled-components.vscode-styled-components" \
	"GitHub.copilot" \
	"rust-lang.rust-analyzer" \ 
	"Vue.volar"
)

for EXTENSION in ${EXTENSIONS[@]}
do
	code --install-extension $EXTENSION --force
done

if [[ ! -L $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
	ln -s ~/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

