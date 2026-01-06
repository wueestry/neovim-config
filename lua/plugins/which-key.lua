-- Which-key: Shows popup with possible keybindings
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = false },
    },
    layout = { spacing = 6 },
    spec = {
      { "<leader>g", group = "git" },
      { "<leader>f", group = "file/find" },
      { "<leader>u", group = "ui" },
      { "<leader>b", group = "buffer" },
      { "<leader>o", group = "opencode" },
      { "<leader>a", group = "avante" },
      { "<leader>c", group = "code" },
      { "<leader>x", group = "trouble" },
      { "<leader>t", group = "toggle" },
      { "<leader>n", group = "notes/obsidian" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
