return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true, -- disables setting the background color.
			integrations = {
				cmp = true,
			},
		})
	end,
}
