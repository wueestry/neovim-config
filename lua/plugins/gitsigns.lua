return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame_opts = {
      delay = 0,
    },
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      -- stylua: ignore start
      map("n", "gn", function() gs.nav_hunk("next") end, { desc = "[G]it [N]ext Hunk" })
      map("n", "gk", function() gs.nav_hunk("prev") end, { desc = "[G]it [P]revious Hunk" })
      map("n", "<leader>gsh", gs.stage_hunk, { desc = "[G]it [S]tage [H]unk" })
      map("n", "<leader>grh", gs.reset_hunk, { desc = "[G]it [R]eset [H]unk" })
      map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[G]it [S]tage Hunk" })
      map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[G]it [R]eset Hunk" })
      map("n", "<leader>gsb", gs.stage_buffer, { desc = "[G]it [S]tage [B]uffer" })
      map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "[G]it [U]ndo Stage Hunk" })
      map("n", "<leader>grb", gs.reset_buffer, { desc = "[G]it [R]eset [B]uffer" })
      map("n", "<leader>gp", gs.preview_hunk, { desc = "[G]it [P]review hunk" })
      map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "[G]it [T]oggle Blame Line" })
      map("n", "<leader>gD", gs.diffthis, {desc="[G]it [D]iff"})
      map("n", "<leader>gd", gs.toggle_deleted, { desc = "[G]it Show [D]eleted" })
    end,
    -- stylua: ignore end
  },
  keys = {
    { "<leader>g", "", desc = "+Git" },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
