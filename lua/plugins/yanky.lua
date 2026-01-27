-- Yanky: Better yank/paste with clipboard history
-- Allows cycling through previous yanks and viewing yank history
return {
  "gbprod/yanky.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    -- Sync with system clipboard (disable if using SSH)
    system_clipboard = {
      sync_with_ring = not vim.env.SSH_CONNECTION,
    },
    -- Highlight yanked text briefly
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 150,
    },
    -- Preserve cursor position after yank
    preserve_cursor_position = {
      enabled = true,
    },
    -- Ring configuration
    ring = {
      -- Keep history of 100 yanks
      history_length = 100,
      -- Store yanks in file for persistence
      storage = "shada",
      -- Sync between vim instances
      sync_with_numbered_registers = true,
    },
  },
  keys = {
    -- View yank history with Telescope
    {
      "<leader>p",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      mode = { "n", "x" },
      desc = "Yank History",
    },
    -- Enhanced yank
    {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank text",
    },
    -- Enhanced paste
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after cursor",
    },
    {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before cursor",
    },
    -- gp/gP for putting and leaving cursor after the text
    {
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after selection",
    },
    {
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before selection",
    },
    -- Cycle through yank history
    {
      "<c-p>",
      "<Plug>(YankyCycleForward)",
      desc = "Cycle forward through yank history",
    },
    {
      "<c-n>",
      "<Plug>(YankyCycleBackward)",
      desc = "Cycle backward through yank history",
    },
    -- Indented paste
    {
      "]p",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)",
    },
    {
      "[p",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)",
    },
    {
      "]P",
      "<Plug>(YankyPutIndentAfterLinewise)",
      desc = "Put indented after cursor (linewise)",
    },
    {
      "[P",
      "<Plug>(YankyPutIndentBeforeLinewise)",
      desc = "Put indented before cursor (linewise)",
    },
    -- Shift right/left while pasting
    {
      ">p",
      "<Plug>(YankyPutIndentAfterShiftRight)",
      desc = "Put and indent right",
    },
    {
      "<p",
      "<Plug>(YankyPutIndentAfterShiftLeft)",
      desc = "Put and indent left",
    },
    {
      ">P",
      "<Plug>(YankyPutIndentBeforeShiftRight)",
      desc = "Put before and indent right",
    },
    {
      "<P",
      "<Plug>(YankyPutIndentBeforeShiftLeft)",
      desc = "Put before and indent left",
    },
    -- Filter paste
    {
      "=p",
      "<Plug>(YankyPutAfterFilter)",
      desc = "Put after applying a filter",
    },
    {
      "=P",
      "<Plug>(YankyPutBeforeFilter)",
      desc = "Put before applying a filter",
    },
  },
}
