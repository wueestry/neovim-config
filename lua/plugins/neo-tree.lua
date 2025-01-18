-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>ee", ":Neotree toggle filesystem left<CR>", desc = "Toggle [E]xplorer [E]", silent = true },
    { "<leader>eb", ":Neotree toggle buffers float<CR>", desc = "Toggle [E]xplorer [B]uffer", silent = true },
    {
      "<leader>ec",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Toggle File [E]xplorer at [C]urrent File",
    },
  },
}
