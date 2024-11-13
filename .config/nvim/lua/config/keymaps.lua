-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<c-/>")
-- start terminal in normal mode using <C-`>
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
vim.keymap.set("n", "<c-`>", lazyterm, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- comment using ctrl+/ in normal and visual mode by running emulation key gcc
vim.keymap.set("n", "<c-/>", "gcc", { remap = true, desc = "Toggle comment for line" })
vim.keymap.set("v", "<c-/>", "gc", { remap = true, desc = "Toggle comment for selection" })

-- vim.keymap.del("i", "<CR>")

local builtin = require("telescope.builtin")
-- leader leader to open buffer
-- vim.keymap.set("n", "<leader><leader>", "<cmd>BufferLinePick<cr>", { desc = "Open Buffer" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- delete buffer
vim.keymap.set("n", "<leader>dd", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- mowving around splits using arrow keys
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
