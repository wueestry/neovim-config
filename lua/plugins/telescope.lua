-- Telescope: Fuzzy finder for files, symbols, and more
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        live_grep = {
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing Buffers" })
    vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find Marks" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current Word" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Recent Files" })
    vim.keymap.set("n", "<leader>fds", function()
      builtin.lsp_document_symbols({
        symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
      })
    end, { desc = "Find LSP document Symbols" })
    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Find in Open Files" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end, { desc = "Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search Git Files" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
    vim.keymap.set("n", "<leader>gcf", builtin.git_bcommits, { desc = "Search Git Commits for current File" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Search Git Branches" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Search Git Status (diff view)" })
  end,
}
