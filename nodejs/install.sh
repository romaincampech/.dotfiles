#!/usr/bin/env bash

set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

nvm install --lts

npm install --global yarn
