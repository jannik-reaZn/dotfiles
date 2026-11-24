return {
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight-night" } },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Markdown headings: colored bold text per level, no background.
        -- Tokyonight tints @markup.heading.N.markdown with a background; that is
        -- what shows on headings, so override those groups (render-markdown links to them).
        local colors = { c.blue, c.magenta, c.green, c.yellow, c.cyan, c.fg_dark }
        for i, color in ipairs(colors) do
          hl["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
          hl["RenderMarkdownH" .. i] = { fg = color, bold = true }
        end
      end,
    },
  },
}
