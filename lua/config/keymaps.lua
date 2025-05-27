vim.g.mapleader = " "

local map = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- Diagnostic keymaps
map.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Split window commands
map.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "[S]plit [H]orizontal" })
map.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "[S]plit [V]ertical" })
map.set("n", "<leader>sc", "<cmd>close<cr>", { desc = "[S]plit [C]lose" })
map.set("n", "<leader>srk", "<cmd>resize +5<cr>", { desc = "[S]plit [R]esize Up [k]" })
map.set("n", "<leader>srj", "<cmd>resize -5<cr>", { desc = "[S]plit [R]esize Down [j]" })
map.set("n", "<leader>srh", "<cmd>vertical resize +3<cr>", { desc = "[S]plit [R]esize Left [h]" })
map.set("n", "<leader>srl", "<cmd>vertical resize -3<cr>", { desc = "[S]plit [R]esize Right [l]" })

-- Change workingdir
map.set("n", "<leader>wc", ":cd %:p:h<CR>:pwd<CR>", { desc = "[W]orkspace [C]hange" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
