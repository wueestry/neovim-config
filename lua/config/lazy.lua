local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("config.autocmds")
require("config.keymaps")
require("config.options")

local opts = {
	checker = {
		enabled = true, -- check for plugin updates periodically
	},
	defaults = {
		lazy = false, -- all plugins are loaded at startup by default
		version = false, -- always use the latest git commit of lazy.nvim
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	perfornamce = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "machit",
				-- "machparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

require("lazy").setup("plugins", opts)
