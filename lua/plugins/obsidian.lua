local obsidian_path = "~/Documents/obsidian"
vim.keymap.set("n", "<leader>oo", "<cmd>cd" .. obsidian_path .. "<cr>", { desc = "change directory to obsidian" })

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = obsidian_path,
      },
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "areas/journal/daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-note" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily-note-template.md",
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    disable_frontmatter = true,

    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      ["<leader>ti"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "inbox",

    ui = {
      enable = false,
    },
  },
  keys = {
    { "<leader>on", "<cmd>Obsidian template note-template<cr>", desc = "apply template to note" },
    { "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "search obsidian vault" },
  },
}
