return {
  -- Ctrl+h/j/k/l moves between Neovim splits and tmux panes seamlessly.
  -- Matching tmux side is in ~/.config/tmux/tmux.conf.
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
}
