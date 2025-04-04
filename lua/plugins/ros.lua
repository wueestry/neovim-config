return {
  "ErickKramer/nvim-ros2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Add any custom options here
    autocmds = true,
    telescope = true,
    treesitter = true,
  },
}
