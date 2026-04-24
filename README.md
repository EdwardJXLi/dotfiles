# Edward Li's Dotfiles

Personal dotfiles, built for zsh with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) and [powerlevel10k](https://github.com/romkatv/powerlevel10k).

## Main Contents

- `dotfiles/`
  - `.zshrc` - main zsh config
  - `.p10k.zsh` / `.p10k-tty.zsh` - p10k configs (for GUI and TTY)
  - `.gitconfig` - git user and global settings
  - `.tmux.conf` - tmux configs
- `zshrc/`
  - `alias.zsh` - shell aliases
  - `autocomplete.zsh` - autocomplete setup
  - `direnv.zsh` - direnv hook
  - `home-manager.zsh` - nix home-manager integration
  - `inline_selection.zsh` - inline selection helper
  - `nix.zsh` - custom nix helper functions
  - `zoxide.zsh` - zoxide hook

## Install

```sh
git clone --recurse-submodules https://github.com/EdwardJXLi/dotfiles .dotfiles
cd .dotfiles
./setup.sh
./setup.sh nobackup   # If you do not want to keep a backup of the current dotfiles
```

> If you want to add any machine-specific configurations, create a `~/.zsh_extras.zsh` file.
