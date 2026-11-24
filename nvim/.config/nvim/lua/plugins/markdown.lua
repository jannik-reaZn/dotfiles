return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        -- No colored bar behind headings; keep the per-level foreground colors.
        backgrounds = {},
      },
      win_options = {
        -- When the plugin is not rendering (insert mode, by default) show the raw text
        -- everywhere: no concealed backticks / ** on any line. The plugin resets
        -- 'conceallevel' to this value on every mode change, so set it here.
        conceallevel = { default = 0 },
      },
      code = {
        -- No background behind code blocks. A highlight group that does not exist adds
        -- nothing, so the treesitter syntax colors (keywords, functions) stay visible.
        -- Linking to Normal instead would override them with the plain text color.
        highlight = "MarkdownCodeBlockNone",
        highlight_border = false,
      },
    },
  },

  -- markdownlint: use our own rules (markdownlint.jsonc), e.g. without MD013 line length.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/markdownlint.jsonc", "-" },
        },
      },
    },
  },
}
