# .dotfiles ⚙️

### Getting started

#### Clone the repository

```bash
git clone git@github.com:Lacampe/dotfiles.git ~/.dotfiles
```

#### Bootstrap the installers and configurations

```bash
(cd ~/.dotfiles && ./bootstrap)
```

#### Useful aliases

| Alias | Description |
| ------| ------------|
| `dotfiles ` | cd into `~/.dotfiles` |
| `bb` | runs `brew bundle` inside ~/.dotfiles/homebrew |
| `mi` | install and update App Store apps installed with `mas` |
| `ip` | print info about your current IP |
| `speedtest` | print info about your current download/upload speed |

### How it works

The dotfiles are organised by topics (i.e., folder), in a similar fashion as [Holman's dotfiles](https://github.com/holman/dotfiles). 

`*/install.sh` files are used to install and update software related to that topic. You can regularly run `dot` from anywhere to make sure your system is up-to-date.

`*/*.symlink` files are symlinked into `$HOME` during bootstrap.
