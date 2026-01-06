-- Avante: AI code assistant and chat for Neovim
return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    cmd = { "AvanteAsk", "AvanteChat", "AvanteToggle", "AvanteEdit" },
    version = false, -- Never set this value to "*"! Never!
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      instructions_file = "AGENTS.md",
      provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-5.1-mini",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20000,
          },
        },
        ollama = {
          endpoint = "http://apollo:11434",
          model = "qwen2.5-coder:14b",
        },
      },
      selector = {
        --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
        --- @type avante.SelectorProvider
        provider = "telescope",
        -- Options override for custom providers
        provider_opts = {},
      },
      behaviour = {
        auto_apply_diff_after_generation = false,
        auto_approve_tool_permissions = false,
      },
      mappings = {
        suggestion = {
          accept = "<C-a>",
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-d>",
        },
      },
    },
  },
}
