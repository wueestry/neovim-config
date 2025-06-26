return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion
  -- source
  dependencies = {
    "saghen/blink.cmp",
  },
  opt = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = true,
      },
    })
  end,
}
