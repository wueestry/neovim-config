return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  event = "VeryLazy",
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open Trouble [X] [W]orkspace Diagnostics" },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Open Trouble [X] [D]ocument Diagnostics",
    },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open Trouble [X] [Q]uickfix List" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open Trouble [X] [L]ocation List" },
    { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open Trouble [X] [T]odos" },
  },
}
