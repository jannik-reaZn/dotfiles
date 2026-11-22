return {
  -- File explorer on the right
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
            -- <C-b> closes the explorer when it has focus (default is preview scroll)
            win = {
              input = { keys = { ["<C-b>"] = { "close", mode = { "i", "n" } } } },
              list = { keys = { ["<C-b>"] = "close" } },
            },
          },
        },
      },
    },
  },

  -- Move the windows group from <leader>w to <leader>W (so <leader>w can save)
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      local spec = {}
      for _, item in ipairs(opts.spec[1] or {}) do
        if item[1] ~= "<leader>w" then
          table.insert(spec, item)
        end
      end
      opts.spec[1] = spec
      table.insert(opts.spec, {
        "<leader>W",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      })
    end,
  },
}
