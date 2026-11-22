# dotfiles

Neovim (LazyVim), tmux and zsh (Oh My Zsh + Powerlevel10k) configuration, managed with
[GNU Stow](https://www.gnu.org/software/stow/). The real files live in this repo and are
symlinked into the home directory.

## Layout

Each top-level folder is a stow package. Its inner path mirrors the location under `~`.

```
nvim/.config/nvim/   -> ~/.config/nvim
tmux/.config/tmux/   -> ~/.config/tmux
zsh/.zshrc           -> ~/.zshrc
zsh/.p10k.zsh        -> ~/.p10k.zsh
```

Cheat sheets: `nvim/.config/nvim/KEYMAPS.md`, `tmux/.config/tmux/KEYMAPS.md`.

## Not synced (on purpose)

- `~/.zshenv` (not needed for now)
- `~/.zsh_history`, `~/.zcompdump*` and other generated files
- `~/.oh-my-zsh` and its theme and plugin clones (reinstalled, see below)
- The tools themselves: nvm, miniforge (conda), cargo/rust, node, and so on. `.zshrc` only
  contains the lines that load them, each guarded, so a missing tool prints no error.
- Machine-specific zsh settings go in `~/.zshrc.local` (loaded if present, ignored by git).

## Setup on a new machine

> Documented, but not tested on a fresh machine yet.

### 1. Prerequisites

Install with the system package manager:

- `git`, `curl`, `stow`, `zsh`, `tmux`, `ripgrep`, `fd` (Debian/Ubuntu: package `fd-find`, binary `fdfind`, link it as `fd`)
- `neovim` **0.11 or newer**
- `node` (needed by several Neovim language servers)
- A **Nerd Font** set in the terminal (needed for the prompt and Neovim icons).
  In Windows Terminal this is a setting on the Windows side, not inside WSL.

Optional, only if you want them (the `.zshrc` skips them when missing): nvm, miniforge (conda), rust (cargo).

### 2. Zsh as login shell

```sh
chsh -s "$(which zsh)"
```

### 3. Oh My Zsh, theme and plugin

Keep the installer from overwriting the config:

```sh
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ~/.oh-my-zsh/custom/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

### 4. Clone this repo

```sh
git clone https://github.com/jannik-reaZn/dotfiles.git ~/dotfiles
```

### 5. Link the configs

Stow refuses to overwrite existing files. Move away anything that is already there:

```sh
mkdir -p ~/old-config
mv ~/.zshrc ~/.p10k.zsh ~/old-config/ 2>/dev/null
mv ~/.config/nvim ~/.config/tmux ~/old-config/ 2>/dev/null
```

Preview, then apply:

```sh
cd ~/dotfiles
stow -nv nvim tmux zsh
stow nvim tmux zsh
```

### 6. First start

1. Open a new terminal. The Powerlevel10k prompt should appear.
2. Run `nvim` once and wait. LazyVim installs plugins, treesitter parsers and the language servers (Mason).
   Check with `:Mason` and `:Lazy`.
3. Run `tmux`.

## Daily use

Edit the files in place (`~/.zshrc`, `~/.config/nvim/...` are the repo files). Then:

```sh
cd ~/dotfiles && git add -p && git commit && git push
```

- After `:Lazy update` in Neovim, commit the changed `lazy-lock.json` too.
- To track another config: create `~/dotfiles/<name>/<path as under ~>`, then `stow <name>`.

## Troubleshooting

- **"existing target is not owned by stow"**: a real file is in the way. Move it away and run stow again.
- **A tool replaced a symlink with a normal file** (for example `p10k configure`): `git status` shows no
  change. Move the new file into `~/dotfiles/zsh/` and run `stow zsh` again.
- **Prompt shows boxes or question marks**: the terminal font is not a Nerd Font.
- **Prompt does not load**: check `~/.oh-my-zsh/custom/themes/powerlevel10k` exists.
- **Neovim file finder fails**: `fd` is missing (on Debian/Ubuntu the binary is called `fdfind`).
- **Neovim plugins or servers missing**: run `:Lazy sync` and `:Mason`.
