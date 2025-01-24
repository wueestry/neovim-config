vim.g.mapleader = " "

local map = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- Diagnostic keymaps
map.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Split window commands
map.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "[S]plit [H]orizontal" })
map.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "[S]plit [V]ertical" })
map.set("n", "<leader>sc", "<cmd>close<cr>", { desc = "[S]plit [C]lose" })
map.set("n", "<leader>srk", "<cmd>resize +5<cr>", { desc = "[S]plit [R]esize Up [k]" })
map.set("n", "<leader>srj", "<cmd>resize -5<cr>", { desc = "[S]plit [R]esize Down [j]" })
map.set("n", "<leader>srh", "<cmd>vertical resize +3<cr>", { desc = "[S]plit [R]esize Left [h]" })
map.set("n", "<leader>srl", "<cmd>vertical resize -3<cr>", { desc = "[S]plit [R]esize Right [l]" })
