-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local keys = vim.keymap
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
keys.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Vertical scroll and center
keys.set('n', '<C-d>', '<C-d>zz', opts)
keys.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
keys.set('n', 'n', 'nzzzv', opts)
keys.set('n', 'N', 'Nzzzv', opts)

-- Toggle line wrapping
keys.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = "Toggle line wrapping" })

-- Stay in indent mode
keys.set('v', '<', '<gv', opts)
keys.set('v', '>', '>gv', opts)

-- Buffers
keys.set('n', '<Tab>', ':bnext<CR>', { desc = "Go to next buffer" })
keys.set('n', '<S-Tab>', ':bprevious<CR>', { desc = "Go to previous buffer" })
keys.set('n', '<leader>x', ':bdelete!<CR>', { desc = "Close current buffer" })

-- Window management
keys.set('n', '<leader>wv', '<C-w>v', { desc = "Split window vertically" })
keys.set('n', '<leader>wh', '<C-w>s', { desc = "Split window horizontally" })
keys.set('n', '<leader>wc', ':close<CR>', { desc = "Close current split window" })

-- Split navigation
keys.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keys.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keys.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keys.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
keys.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keys.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keys.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keys.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })