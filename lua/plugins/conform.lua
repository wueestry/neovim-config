return { -- Autoformat
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {

      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      python = { "ruff" },

      nix = { "nixfmt" },
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
