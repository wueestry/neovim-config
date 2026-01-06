local obsidian_path = "~/Documents/obsidian"
vim.keymap.set("n", "<leader>oo", "<cmd>cd " .. obsidian_path .. "<cr>", { desc = "change directory to obsidian" })

-- Obsidian.nvim: Note-taking, daily notes, and markdown integration for Neovim
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = obsidian_path,
      },
    },

    templates = {
      subdir = "meta/templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "fleeting-notes",
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

    attachments = {
      img_folder = "meta/assets",
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
    { "<leader>on", "<cmd>Obsidian template note-template<cr>", desc = "apply note template" },
    { "<leader>oj", "<cmd>Obsidian template daily-note-template<cr>", desc = "apply daily note template" },
    { "<leader>os", "<cmd>Obsidian quick_switch<cr>", desc = "search obsidian vault" },
  },
}
