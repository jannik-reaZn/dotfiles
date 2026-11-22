# LazyVim Cheat Sheet

`<leader>` = **Space**. Press it and wait: **which-key** shows every available follow-up key.
Add your own findings at the bottom (“My notes”).

## Discovering things

| Keys                           | What                                          |
| ------------------------------ | --------------------------------------------- |
| `<leader>` (wait)              | which-key popup of all groups                 |
| `<leader>sk`                   | Search all keymaps                            |
| `<leader>sh`                   | Search help                                   |
| `<leader>sc` / `<leader>:`     | Command history / command palette-like picker |
| `<leader>l`                    | Lazy (plugin manager)                         |
| `<leader>cm` or `:Mason`       | Mason (LSP / formatter installer)             |
| `:LazyExtras`                  | Enable language/tool extras                   |
| `:LazyHealth` / `:checkhealth` | Diagnose problems                             |
| `:LspInfo`                     | Which LSP is attached to this buffer          |

## My custom changes

| Keys              | What                                                                                                   |
| ----------------- | ------------------------------------------------------------------------------------------------------ |
| `<leader>w`       | **Save** file                                                                                          |
| `<leader>W` + key | Window commands (was `<leader>w`), e.g. `<leader>Wh/j/k/l` move, `<leader>Wd` close, `<leader>Wm` zoom |
| `jj` (insert)     | Escape                                                                                                 |
| `<leader>e` / `<C-b>` | File explorer (on the **right**)                                                                   |
| `<C-w>`           | Close current file (buffer). The old `<C-w>` window prefix is now `<leader>W`                          |
| `<C-p>`           | Fuzzy find files (also `<leader><space>`)                                                              |
| `<S-Tab>` | Previous buffer (tab); next is `<S-l>` |

## Files, search, buffers

| Keys                        | What                                                                                  |
| --------------------------- | ------------------------------------------------------------------------------------- |
| `<leader><space>`           | Find files (project root)                                                             |
| `<leader>ff` / `<leader>fF` | Find files (root / cwd)                                                               |
| `<leader>fr`                | Recent files                                                                          |
| `<leader>/`                 | Grep in project                                                                       |
| `<leader>sw`                | Grep word under cursor                                                                |
| `<leader>,`                 | Switch buffer                                                                         |
| `<leader>bd`                | Close buffer                                                                          |
| `<leader>bo`                | Close all other buffers                                                               |
| `<S-h>` / `<S-l>`           | Previous / next buffer                                                                |
| `<leader>e`                 | Toggle explorer. In it: `a` add, `d` delete, `r` rename, `c` copy, `m` move, `?` help |

## Code / LSP (the VS Code stuff)

| Keys              | What                               |
| ----------------- | ---------------------------------- |
| `gd`              | Go to definition                   |
| `gr`              | References                         |
| `gI`              | Go to implementation               |
| `gy`              | Go to type definition              |
| `K`               | Hover docs                         |
| `gK`              | Signature help                     |
| `<leader>ca`      | Code action (quick fix, import, …) |
| `<leader>cr`      | Rename symbol                      |
| `<leader>cf`      | Format file                        |
| `<leader>cd`      | Line diagnostics                   |
| `<leader>cl`      | LSP info                           |
| `<leader>ss`      | Symbols in file (outline-like)     |
| `<leader>sS`      | Symbols in workspace               |
| `<leader>xx`      | Diagnostics list (Trouble)         |
| `]d` / `[d`       | Next / previous diagnostic         |
| `]e` / `[e`       | Next / previous error              |
| `<C-o>` / `<C-i>` | Jump back / forward (after `gd`)   |

## Completion (blink.cmp)

| Keys                        | What                              |
| --------------------------- | --------------------------------- |
| `<C-space>`                 | Open completion / docs            |
| `<C-n>` / `<C-p>` or arrows | Navigate                          |
| `<CR>` or `<C-y>`           | Accept                            |
| `<C-e>`                     | Close                             |
| `<Tab>` / `<S-Tab>`         | Jump through snippet placeholders |

## Windows, splits, tabs

| Keys                       | What                   |
| -------------------------- | ---------------------- |
| `<C-h/j/k/l>` | Move between windows and tmux panes (vim-tmux-navigator) |
| `<leader>-` / `<leader>\|` | Split below / right    |
| `<leader>Wd`               | Close window           |
| `<leader>Wm`               | Zoom / maximize window |
| `<C-Up/Down/Left/Right>`   | Resize window          |
| `<leader><tab><tab>`       | New tab                |
| `<leader><tab>]` / `[`     | Next / previous tab    |

## Editing

| Keys                        | What                                   |
| --------------------------- | -------------------------------------- |
| `<A-j>` / `<A-k>`           | Move line / selection down / up        |
| `J` / `K` (visual mode)       | Move selected lines down / up          |
| `gcc`                       | Toggle comment line                    |
| `gc` (visual)               | Toggle comment selection               |
| `gsa` / `gsd` / `gsr`       | Surround: add / delete / replace       |
| `s` + 2 chars               | Flash: jump anywhere on screen         |
| `<C-s>`                     | Save (also works in insert mode)       |
| `<leader>qq`                | Quit all                               |
| `<leader>uw`                | Toggle word wrap                       |
| `<leader>us`                | Toggle spell check                     |
| `<leader>ur`                | Clear search highlight / redraw        |
| `<leader>uf`                | Toggle format on save                  |
| `<leader>ul` / `<leader>uL` | Toggle line numbers / relative numbers |

## Git

| Keys                          | What                                |
| ----------------------------- | ----------------------------------- |
| `<leader>gg`                  | Lazygit (needs `lazygit` installed) |
| `<leader>gs`                  | Git status picker                   |
| `<leader>gb`                  | Git blame line                      |
| `]h` / `[h`                   | Next / previous hunk                |
| `<leader>ghs` / `<leader>ghr` | Stage / reset hunk                  |
| `<leader>ghp`                 | Preview hunk                        |

## Debugging (nvim-dap)

| Keys                        | What                                         |
| --------------------------- | -------------------------------------------- |
| `<leader>db`                | Toggle breakpoint                            |
| `<leader>dB`                | Conditional breakpoint                       |
| `<leader>dc`                | Start / continue                             |
| `<leader>dC`                | Run to cursor                                |
| `<leader>dO`                | Step over                                    |
| `<leader>di`                | Step into                                    |
| `<leader>do`                | Step out                                     |
| `<leader>dl`                | Run last debug config                        |
| `<leader>dt`                | Terminate session                            |
| `<leader>dP`                | Pause                                        |
| `<leader>du`                | Toggle debug UI (scopes, stack, watches)     |
| `<leader>de`                | Eval expression (normal / visual)            |
| `<leader>dw`                | Hover widget for variable under cursor       |
| `<leader>dr`                | Toggle REPL                                  |
| `<leader>dj` / `<leader>dk` | Move down / up the stack frames              |
| `<leader>dPt` / `<leader>dPc` | Python: debug test method / test class     |

Workflow: set a breakpoint with `<leader>db`, press `<leader>dc` and pick "Launch file" (Python uses debugpy, installed via Mason). The UI opens automatically. `<leader>dP` is also the prefix for `dPt`/`dPc`, so which-key waits briefly before pausing.

## Terminal

| Keys                  | What                     |
| --------------------- | ------------------------ |
| `<C-/>`               | Toggle floating terminal |
| `<C-/>` (in terminal) | Hide it                  |
| `<C-\><C-n>`          | Terminal normal mode     |

## Language-specific

- **Rust**: `<leader>cR` code action grouping (rustaceanvim), `<leader>dr` debug runnables (in Rust buffers; elsewhere it toggles the DAP REPL). Cargo.toml completion via crates.nvim.
- **TypeScript / Vue**: `<leader>co` organize imports, `<leader>cM` add missing imports, `<leader>cu` remove unused imports. For Vue, both `vue_ls` and `vtsls` should be attached (`:LspInfo`).
- **Python**: `<leader>cv` select virtualenv (venv-selector). Ruff formats and lints, pyright does types.

## Vim tricks worth learning

- `ciw` change word, `ci"` change inside quotes, `dap` delete paragraph, `vi{` select inside braces
- `%` jump to matching bracket, `*` search word under cursor, `.` repeat last change
- `u` / `<C-r>` undo / redo
- `zz` center cursor line, `zc` / `zo` close / open fold
- `gg` / `G` top / bottom, `{` / `}` paragraph jumps
- Macros: `qa` … `q` record to register a, `@a` replay
- `:%s/old/new/gc` replace with confirmation

## My notes

-
