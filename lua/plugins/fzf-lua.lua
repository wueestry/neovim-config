return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
  end,
  keys = {
    {
      "<leader>ff", 
      function() 
        require("fzf-lua").files() 
      end,
      desc = "Search files",  
    }
  },
}
