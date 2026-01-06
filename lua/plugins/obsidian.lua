-- Obsidian.nvim: Note-taking, daily notes, and markdown integration for Neovim
local obsidian_path = "~/Documents/obsidian"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
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
      folder = "fleeting-notes",
      date_format = "%Y-%m-%d",
      default_tags = { "daily-note" },
      template = "daily-note-template.md",
    },

    completion = {
      blink = true,
      min_chars = 2,
    },

    disable_frontmatter = true,

    attachments = {
      img_folder = "meta/assets",
    },

    new_notes_location = "notes_subdir",
    notes_subdir = "inbox",

    ui = {
      enable = false,
    },
  },
  keys = {
    { "<leader>no", "<cmd>cd " .. obsidian_path .. "<cr>", desc = "change directory to obsidian" },
    { "<leader>nn", "<cmd>ObsidianTemplate note-template<cr>", desc = "apply note template" },
    { "<leader>nj", "<cmd>ObsidianTemplate daily-note-template<cr>", desc = "apply daily note template" },
    { "<leader>ns", "<cmd>ObsidianQuickSwitch<cr>", desc = "search obsidian vault" },
  },
}
