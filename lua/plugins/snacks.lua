-- Snacks: Modern UI, dashboard, notifications, and utilities for Neovim

return {
  "folke/snacks.nvim",
  priority = 1000, -- setup early
  lazy = false, -- load eagerly so sub-modules are available to other plugins
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, recommended for icons

  -- Enable the snacks modules you want (defaults shown are sensible defaults)
  opts = {
    bigfile = {
      enabled = true,
      line_length = 2000,
      file_size = 5 * 1024 * 1024, -- 5 MB
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    picker = { enabled = false },
    quickfile = { enabled = false },
    terminal = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    image = {
      resolve = function(path, src)
        local ok, obsidian_api = pcall(require, "obsidian.api")
        if ok and obsidian_api.path_is_note(path) then
          return obsidian_api.resolve_image_path(src)
        end
      end,
    },
    styles = {
      notification = {},
    },
  },

  -- Useful keymaps (call plugin APIs lazily via require)
  keys = {
    {
      "<leader>z",
      function()
        require("snacks").zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>.",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        require("snacks").scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
    {
      "<leader>bd",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>gB",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>tt",
      function()
        require("snacks").terminal()
      end,
      desc = "Toggle Terminal",
    },
  },

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local Snacks = require("snacks")

        -- expose a global helper for quick debugging/REPL usage (optional)
        _G.Snacks = Snacks

        -- create some common toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.diagnostics():map("<leader>ud")
      end,
    })
  end,

  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts or {})
  end,
}
