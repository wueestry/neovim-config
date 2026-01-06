-- todo-comments: Highlight and search for TODO, FIXME, and similar comments
return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
  },
}

