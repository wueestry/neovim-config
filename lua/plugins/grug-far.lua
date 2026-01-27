-- Grug-far: Modern search and replace in multiple files
-- Interactive UI for finding and replacing text across your project
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  opts = {
    -- Maximum width for the header
    headerMaxWidth = 80,
    -- Start in normal mode instead of insert mode
    startInInsertMode = false,
    -- Transient mode (buffer gets deleted when you leave it)
    transient = false,
    -- Keybindings
    keymaps = {
      replace = { n = "<localleader>r" },
      qflist = { n = "<localleader>q" },
      syncLocations = { n = "<localleader>s" },
      syncLine = { n = "<localleader>l" },
      close = { n = "<localleader>c" },
      historyOpen = { n = "<localleader>t" },
      historyAdd = { n = "<localleader>a" },
      refresh = { n = "<localleader>f" },
      openLocation = { n = "<localleader>o" },
      gotoLocation = { n = "<enter>" },
      pickHistoryEntry = { n = "<enter>" },
      abort = { n = "<localleader>b" },
      help = { n = "g?" },
    },
    -- Icons
    icons = {
      enabled = vim.g.have_nerd_font or false,
      -- You can override specific icons
      -- actionEntryBullet = "🔹",
    },
    -- Engine configuration
    engines = {
      -- Use ripgrep as the search engine
      ripgrep = {
        -- Additional args for ripgrep
        extraArgs = "",
      },
    },
  },
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            -- Prefill the file filter with the current file extension
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
    {
      "<leader>sR",
      function()
        local grug = require("grug-far")
        grug.open({
          transient = true,
        })
      end,
      desc = "Search and Replace (all files)",
    },
    {
      "<leader>sw",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            -- Prefill with the word under cursor
            search = vim.fn.expand("<cword>"),
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      desc = "Search and Replace (word)",
    },
    {
      "<leader>sf",
      function()
        local grug = require("grug-far")
        grug.open({
          transient = true,
          prefills = {
            -- Search only in the current file
            paths = vim.fn.expand("%"),
          },
        })
      end,
      desc = "Search and Replace (current file)",
    },
  },
}
