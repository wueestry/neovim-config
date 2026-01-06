-- Oil: Modern file explorer for Neovim
return {
  "stevearc/oil.nvim",
  opts = {
    -- See :help oil-config for options
    columns = { "icon", "permissions", "size", "mtime" },
    view_options = {
      show_hidden = true,
      natural_order = true,
    },

    default_file_explorer = true,
    delete_to_trash = true,
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open Oil file explorer",
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
