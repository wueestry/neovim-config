-- Render Markdown: Enhanced markdown rendering with completions and LaTeX
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { "markdown" },
  opts = {
    completions = {
      blink = {
        enabled = true,
      },
    },
    latex = {
      enabled = true,
    },
  },
}
