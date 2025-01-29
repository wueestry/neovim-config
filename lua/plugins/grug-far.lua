return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>ro", "<cmd>GrugFar<cr>", desc = "Search & [R]eplace [O]pen" },
    {
      "<leader>rf",
      "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>",
      desc = "Search & [R]eplace Open (Limit to Current [F]ile)",
    },
    {
      "<leader>rw",
      "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<cr>",
      desc = "Search & [R]eplace [W]ord Under Cursor",
    },
    {
      "<leader>rs",
      mode = "v",
      "<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<cr>",
      desc = "Search & [R]eplace [S]earch Section",
    },
  },
}
