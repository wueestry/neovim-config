return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = function()
      require("mini.surround").setup()
    end,
  },
}
