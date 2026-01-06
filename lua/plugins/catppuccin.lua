-- Catppuccin: Modern colorscheme with integrations
return {
  "catppuccin/nvim",
  enabled = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        lualine = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        cmp = true,
        gitsigns = true,
        blink_cmp = true,
        native_lsp = { enabled = true },
      },
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
