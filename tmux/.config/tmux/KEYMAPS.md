# tmux Cheat Sheet

Prefix: `Ctrl+s`
Config: `~/.config/tmux/tmux.conf`. Reload with `<prefix> r`.

## Concepts

- **Session**: the whole workspace. Keeps running after you close the terminal.
- **Window**: like a tab inside a session.
- **Pane**: a split inside a window.

## Sessions (from the shell)

| Command                          | What                                    |
| -------------------------------- | --------------------------------------- |
| `tmux`                           | Start a new session                     |
| `tmux new -s work`               | New session named "work"                |
| `tmux ls`                        | List sessions                           |
| `tmux attach` / `tmux a -t work` | Reattach (to last / to "work")          |
| `tmux kill-session -t work`      | End a session                           |
| `tmux kill-session -a`           | End all sessions except the current one |

## Inside tmux

| Keys         | What                           |
| ------------ | ------------------------------ |
| `<prefix> d` | Detach (session keeps running) |
| `<prefix> $` | Rename session                 |
| `<prefix> s` | Switch between sessions        |
| `<prefix> ?` | List all keybindings           |

## Windows

| Keys                         | What                                             |
| ---------------------------- | ------------------------------------------------ |
| `<prefix> c`                 | New window                                       |
| `<prefix> 1`–`9`             | Go to window by number (they start at 1)         |
| `<prefix> n` / `<prefix> p`  | Next / previous window                           |
| `<prefix> ,`                 | Rename window                                    |
| `<prefix> &`                 | Close window (asks to confirm)                   |
| `tmux kill-window -t work:2` | From the shell: close window 2 of session "work" |
| `<prefix> w`                 | Pick a window from a list                        |

## Panes

| Keys                   | What                                                                             |
| ---------------------- | -------------------------------------------------------------------------------- |
| `<prefix> %`           | Split side by side (left / right)                                                |
| `<prefix> "`           | Split top / bottom                                                               |
| `<prefix> arrows`      | Move to pane in that direction                                                   |
| `Ctrl+h/j/k/l`         | Move to left/down/up/right pane, no prefix needed (also crosses Neovim splits)   |
| `<prefix> o`           | Next pane                                                                        |
| `<prefix> z`           | Zoom pane to full screen, again to restore                                       |
| `<prefix> x`           | Close pane (asks to confirm)                                                     |
| `<prefix> {` / `}`     | Swap pane with previous / next                                                   |
| `<prefix> Ctrl+arrows` | Resize pane in that direction by 1 cell (hold `Ctrl` to repeat), default binding |
| `<prefix> Alt+arrows`  | Resize pane in that direction by 5 cells, default binding                        |
| `<prefix> Space`       | Cycle through pane layouts                                                       |
| `<prefix> q`           | Show pane numbers (press number to jump)                                         |
| Mouse                  | Click a pane to focus, drag a border to resize                                   |

## Scrolling and copying

| Keys                                    | What                                                |
| --------------------------------------- | --------------------------------------------------- |
| Mouse wheel                             | Scrolls the pane history (mouse is on)              |
| `<prefix> [`                            | Scroll mode: arrows, `PageUp/PageDown`, `q` to quit |
| In scroll mode `Ctrl+s`                 | Search forward (`n` for next match)                 |
| Hold `Shift` while selecting with mouse | Select text for the normal terminal copy            |

## Using tmux with Neovim

- **`<prefix>` is `Ctrl+s`.** Inside tmux, `Ctrl+s` goes to tmux first.
  Press `Ctrl+s` **twice** to send one real `Ctrl+s` to the program in the pane.
  The prefix is set with `set -g prefix C-s`, `unbind C-b`, `bind C-s send-prefix` in the config.
- Typical layout: Neovim in one pane, shell in another (`<prefix> %`), `<prefix> z` to zoom Neovim when you need space.
- Neovim's own terminal (`<C-/>`) still works inside tmux.
- **`Ctrl+h/j/k/l` moves between tmux panes and Neovim splits** (vim-tmux-navigator). In a Neovim pane the key goes to Neovim first and only leaves for tmux at the edge of its splits.
- `Ctrl+l` no longer clears the screen in a shell pane inside tmux. Use `<prefix> Ctrl+l` or type `clear`.

## Tricks

- Closing the terminal window does **not** kill your session. Run `tmux ls`, then `tmux attach` to continue.
- Start-or-attach in one command: `tmux new -As work` (attach to "work", create if missing).
- A pane's process dies with the pane. For a dev server, give it its own window and detach, it keeps running.
- Edited the config? `<prefix> r`. If something looks off, check for typos with `tmux source-file ~/.config/tmux/tmux.conf`.
- Lost? `<prefix> ?` lists every key.

## My notes

-
