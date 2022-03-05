#!/usr/bin/env bash

set -e

DOTFILES_ROOT=$(pwd -P)

create_workspace_directory()
{
	mkdir -p ~/workspace
}

install_homebrew()
{
	if test ! $(which brew); then
		echo "Installing Homebrew..."
		/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
	else 
		echo "Updating Homebrew..."
		brew update
	fi
}

symlink_dotfiles () {
	echo "Symlinking dotfiles..."

	local overwrite_all=false backup_all=false skip_all=false

	for source in $(find -H $DOTFILES_ROOT -maxdepth 2 -name "*.symlink")
	do
		local name=$(basename "${source%.*}")
		local dest="$HOME/.${name//_//}"

		mkdir -p $(dirname "${dest}")

		if [[ -f $dest ]] || [[ -d $dest ]] || [[ -L $dest ]]; then
			local overwrite=false backup=false skip=false

			if [[ $overwrite_all == "false" ]] && [[ $backup_all == "false" ]] && [[ $skip_all == "false" ]]; then
				local current_source=$(readlink $dest)

				if [[ $current_source == $source ]]; then
					skip=true;
				else
					echo "File already exists: $dest ($(basename "$source")) - what do you want to do? [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all, [s]kip, [S]kip all"
					read -n 1 action

					case $action in
						o )
							overwrite=true;;
						O )
							overwrite_all=true;;
						b )
							backup=true;;
						B )
							backup_all=true;;
						s )
							skip=true;;
						S )
							skip_all=true;;
						* )
							;;
					esac
				fi				
			fi

			if [[ $overwrite_all == "true" ]] || [[ $overwrite == "true" ]]; then
				rm -rf $dest
			fi

			if [[ $backup_all == "true" ]] || [[ $backup == "true" ]]; then
				mv $dest "${dest}.backup"
			fi

			if [[ $skip_all == "false" ]] && [[ $skip == "false" ]]; then
				ln -s $source $dest
			fi			
		else
			ln -s $source $dest
		fi

	done
}

run_installers()
{
	source bin/dot | while read -r data; do echo $data; done
}

authenticate_github_cli()
{
	gh auth login
}

create_workspace_directory
install_homebrew
symlink_dotfiles
run_installers
authenticate_github_cli
