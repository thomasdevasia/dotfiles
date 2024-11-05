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
