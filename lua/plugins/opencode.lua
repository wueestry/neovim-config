-- Opencode: AI-powered code actions and prompts for Neovim
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for default `toggle()` implementation.
    "folke/snacks.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.opencode_ops = {
      provider = {
        enabled = "snacks",
      },
    }
    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>coa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>cox", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "x" }, "<leader>coA", function()
      require("opencode").prompt("@this")
    end, { desc = "Add to opencode" })
    vim.keymap.set({ "n", "t" }, "<leader>coo", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })
  end,
}
