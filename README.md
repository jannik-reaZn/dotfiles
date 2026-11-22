# dotfiles

Neovim (LazyVim) and tmux configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

```
nvim/.config/nvim/   -> ~/.config/nvim
tmux/.config/tmux/   -> ~/.config/tmux
```

## Setup on a new machine

Prerequisites: `git`, `stow`, `neovim` 0.11+, `tmux`, `ripgrep`, `fd`, `node`, a Nerd Font in the terminal.

```sh
git clone https://github.com/jannik-reaZn/dotfiles.git ~/dotfiles
# move away any existing ~/.config/nvim and ~/.config/tmux first
cd ~/dotfiles && stow nvim tmux
nvim   # first start installs plugins and language servers
```

Cheat sheets: `nvim/.config/nvim/KEYMAPS.md`, `tmux/.config/tmux/KEYMAPS.md`.
