-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode with jj" })

-- <leader>w saves; windows live under <leader>W (see lua/plugins/ui.lua)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
-- LazyVim's <leader>wd / <leader>wm defaults would now be "w" + "d"/"m" prefixes; remove and rebind
for _, k in ipairs({ "<leader>wd", "<leader>wm" }) do
  pcall(vim.keymap.del, "n", k)
end
vim.keymap.set("n", "<leader>Wd", "<C-W>c", { desc = "Delete Window", remap = true })
vim.keymap.set("n", "<leader>Wm", function() Snacks.zen.zoom() end, { desc = "Zoom Window" })

-- Close current buffer (file) with Ctrl+w; window commands are on <leader>W
vim.keymap.set({ "n", "i" }, "<C-w>", function() Snacks.bufdelete() end, { desc = "Close buffer" })
-- Close all buffers (including the current one)
vim.keymap.set("n", "<leader>ba", function() Snacks.bufdelete.all() end, { desc = "Close all buffers" })
-- Toggle the file explorer (right side) with Ctrl+b, same as <leader>e
vim.keymap.set({ "n", "i" }, "<C-b>", function()
  local open = Snacks.picker.get({ source = "explorer" })[1]
  if open then
    open:close()
  else
    Snacks.explorer({ cwd = LazyVim.root() })
  end
end, { desc = "Toggle explorer" })
-- Remove longer <C-w>… mappings so <C-w> fires immediately (no timeout wait)
for _, k in ipairs({ "<C-W><Space>", "<C-W><C-D>", "<C-W>d" }) do
  pcall(vim.keymap.del, "n", k)
end

-- Shift-Tab: previous buffer (tab). Next is <S-l>.
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Visual mode: Shift+j / Shift+k move the selected lines down / up (and keep the selection).
-- Replaces visual J (join lines) and K (keyword lookup).
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Ctrl+p: fuzzy find files (like VS Code)
vim.keymap.set("n", "<C-p>", function() Snacks.picker.files({ cwd = LazyVim.root() }) end, { desc = "Find files" })

-- Ctrl+h/j/k/l: move between Neovim splits and tmux panes (overrides LazyVim's window nav)
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Go to left window/pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Go to lower window/pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Go to upper window/pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Go to right window/pane" })
