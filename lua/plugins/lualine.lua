-- Lualine: Statusline plugin with theme and icons
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- loads lualine when needed, not at startup
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup({
      options = {
        theme = "nord",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "dashboard", "NvimTree", "oil", "snacks_dashboard" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "quickfix", "fugitive" },
    })
  end,
}
