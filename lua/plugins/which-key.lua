return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    spec = {
      { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>r", group = "[R]eplace" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>g", group = "[G]it" },
      { "<leader>e", group = "[E]xplorer" },
      { "<leader>x", group = "Trouble [X]" },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>s", group = "[S]plit" },
      { "<leader>a", group = "[A]vante" },
    },
  },
}
