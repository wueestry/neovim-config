-- lua/config/options.lua
-- General Neovim options and feature flags with explanatory comments.

local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- Feature flags
-- Set this to true if you have a Nerd Font (patched) installed.
-- Plugins (statusline, tree, etc.) can check this flag to decide whether to show special icons.
g.have_nerd_font = true

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Appearance
-- Enable 24-bit RGB colors in the terminal (required for many modern colorschemes).
o.termguicolors = true
-- Preferred background for colorschemes ("dark" or "light").
o.background = "dark"
-- Highlight the screen line of the cursor for better visibility.
o.cursorline = true
-- Reserve space for sign columns (git/diagnostics) to avoid text shifting when signs appear.
o.signcolumn = "yes"

-- Line numbers
-- Show absolute line number for the cursor line.
o.number = true
-- Show relative line numbers for other lines (helpful for motions like 5j, 10k).
o.relativenumber = true

-- Mouse & clipboard
-- Enable mouse support in all modes (useful in terminal GUIs that support mouse).
o.mouse = "a"
-- Use the system clipboard for yank, delete, change and put operations.
vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

-- Tabs & indentation
-- Use spaces instead of tab characters.
o.expandtab = true
-- Number of spaces to use for each step of (auto)indent.
o.shiftwidth = 2
-- Number of spaces that a <Tab> counts for.
o.tabstop = 2
-- Enable smart indentation for C-like languages.
o.smartindent = true

-- Enable break indent
o.breakindent = true

-- Search behavior
-- Ignore case in search patterns unless the pattern contains uppercase characters.
o.ignorecase = true
o.smartcase = true
-- Show incremental search matches as you type.
o.incsearch = true

-- Wrapping and scrolling
-- Do not wrap long lines by default.
o.wrap = false
-- Keep this many screen lines above and below the cursor.
o.scrolloff = 8
-- Keep this many screen columns to the left/right of the cursor.
o.sidescrolloff = 8

-- Files, backups, undo
-- Disable swapfiles (can be changed if you want crash recovery files).
o.swapfile = false
-- Disable backup files created by Vim.
o.backup = false
-- Enable persistent undo so undo history persists across sessions.
o.undofile = true

-- Performance
-- Time (ms) to wait before triggering CursorHold and other events. Lower = more responsive.
o.updatetime = 200
-- Time (ms) to wait for a mapped sequence to complete.
o.timeoutlen = 500

-- Completion and messages
-- Don't show extra messages when using completion (shorten messages).
o.shortmess:append("c")
-- Better options for insert-mode completion menus.
o.completeopt = { "menu", "menuone", "noinsert", "noselect" }

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Misc
-- Use a reasonable command-line height for messages (if desired, leave default otherwise).
-- vim.o.cmdheight = 1
