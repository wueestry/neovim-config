-- Conform: Formatter and linter integration for Neovim
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Ruff handles both formatting and import sorting (no need for isort)
      python = { "ruff_format", "ruff_organize_imports" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    -- Custom formatter configurations
    formatters = {
      -- Configure ruff_format for Python code formatting
      ruff_format = {
        command = "ruff",
        args = { "format", "--force-exclude", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
      },
      -- Configure ruff_organize_imports for import sorting
      ruff_organize_imports = {
        command = "ruff",
        args = { "check", "--select", "I", "--fix", "--force-exclude", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
      },
    },
  },
  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format()
      end,
      desc = "Format buffer",
    },
  },
}
