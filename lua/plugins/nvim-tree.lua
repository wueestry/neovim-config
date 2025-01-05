return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			auto_reload_on_write = true,
			disable_netrw = true,
			hijack_cursor = false,
			hijack_unnamed_buffer_when_opening = false,
			sort_by = "name",
			filters = {
				dotfiles = false,
			},
			git = {
				ignore = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			view = {
				adaptive_size = true,
				relativenumber = true,
			},
		})

		vim.keymap.set("n", "<leader>ee", require("nvim-tree.api").tree.toggle, {
			silent = true,
			desc = "Toggle nvim-tree",
		})
	end,
}
