return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "ollama", -- Use ollama as the provider for language models
    ollama = {
      endpoint = "http://apollo:11434", -- URL of the ollama server
      model = "qwen2.5-coder:7b", -- Specific model to use
    },
    behaviour = {
      enable_cursor_planning_mode = true, -- Recommended when using ollama for better cursor planning
    },
  },
  build = "make", -- Build command assumes a Makefile is present in the plugin directory
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Dependency for syntax highlighting and parsing
    "stevearc/dressing.nvim", -- Dependency for enhanced UI components
    "nvim-lua/plenary.nvim", -- Utility library for Neovim plugins
    "MunifTanjim/nui.nvim", -- Library for building user interfaces in Neovim
    --- The below dependencies are optional,
    -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  },
}
