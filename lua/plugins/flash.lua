-- Flash: Enhanced navigation and search with labels for quick jumping
-- Press 's' to search and jump, 'S' for treesitter selection, 'r' for remote operations
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- Enable labels at the end of each match for quick jumping
    labels = "asdfghjklqwertyuiopzxcvbnm",
    -- Search settings
    search = {
      -- Search in both directions
      forward = true,
      -- Wrap around the file
      wrap = true,
      -- Multi-window search
      multi_window = true,
      -- When to show the search results
      mode = "exact",
    },
    -- Jump settings
    jump = {
      -- Jump on partial match (before pressing Enter)
      autojump = false,
      -- Jump position
      pos = "start",
    },
    -- Label settings
    label = {
      -- Put labels after the match
      after = true,
      before = false,
      -- Style for labels
      style = "overlay",
      -- Reuse labels for multiple matches
      reuse = "lowercase",
    },
    -- Highlight settings
    highlight = {
      -- Show a backdrop with hl FlashBackdrop
      backdrop = true,
      -- Highlight matches
      matches = true,
    },
    -- Prompt settings
    prompt = {
      enabled = true,
      prefix = { { "⚡", "FlashPromptIcon" } },
    },
    -- Modes configuration
    modes = {
      -- Options for search mode
      search = {
        enabled = true,
      },
      -- Options for character mode (f, F, t, T motions)
      char = {
        enabled = true,
        -- Show labels for f/t jumps
        jump_labels = true,
        -- Enable multi-line f/t jumps
        multi_line = true,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
