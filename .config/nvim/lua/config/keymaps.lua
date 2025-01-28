-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- start terminal in normal mode using <C-`>
-- local lazyterm = function()
--   LazyVim.terminal(nil, { cwd = LazyVim.root() })
-- end
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<leader>fe")
vim.keymap.set("n", "<c-`>", function()
  Snacks.terminal()
end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<c-`>", function()
  Snacks.terminal()
end, { desc = "Hide Terminal" })

-- comment using ctrl+/ in normal and visual mode by running emulation key gcc
vim.keymap.set("n", "<c-/>", "gcc", { remap = true, desc = "Toggle comment for line" })
vim.keymap.set("v", "<c-/>", "gc", { remap = true, desc = "Toggle comment for selection" })
vim.keymap.set("i", "<c-/>", "<esc>gccA", { remap = true, desc = "Toggle comment for line" })

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

-- find files using grep
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find file using grep" })

-- scratch pad
vim.keymap.set("n", "<leader>.", function()
  Snacks.scratch()
end, { desc = "Open Scratchpad" })

-- opening oil
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- find files cwd
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
-- find files root
vim.keymap.set("n", "<leader>fd", function()
  builtin.find_files({ cwd = LazyVim.root() })
end, { desc = "Find file in root" })

-- next buffers
vim.keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<M-right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<M-left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- open explorer in full screen
vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { desc = "Open explorer" })

-- do kind of ctrl-d
-- vim.keymap.set("v", "<C-d>", function()
--   local start_pos = vim.fn.getpos("'<")
--   local end_pos = vim.fn.getpos("'>")
--   local lines = vim.fn.getline(start_pos[2], end_pos[2])
--
--   -- Ensure `lines` is a table
--   if type(lines) ~= "table" then
--     lines = { lines }
--   end
--
--   -- Extract the selected text
--   if #lines == 1 then
--     -- Single-line selection
--     lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
--   else
--     -- Multi-line selection: adjust first and last line
--     lines[1] = string.sub(lines[1], start_pos[3])
--     lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
--   end
--
--   local selected_text = table.concat(lines, "\n")
--
--   -- perform esacpe button
--   -- local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
--   -- vim.api.nvim_feedkeys(esc, "x", false)
--   -- Snacks.notify("Selected text: " .. selected_text)
--   vim.cmd(":%s/" .. vim.fn.escape(selected_text, "/") .. "/")
-- end, { noremap = true, silent = false, desc = "Search and replace selected text" })
