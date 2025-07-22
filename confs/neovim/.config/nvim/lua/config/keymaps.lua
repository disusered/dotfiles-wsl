-- This file is automatically loaded by lazyvim.config.init

-- The default keymaps can be found in the LazyVim documentation:
-- https://www.lazyvim.org/configuration/general#keymaps

-- This file contains custom keymaps, as well as overrides for the default keymaps.

-- remove buffer changing keymaps
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- disable floating terminal keymaps
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<C-_>")

-- disable window keymaps
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

-- my personal keymaps
vim.keymap.set("n", "<leader><enter>", "<cmd>w<CR>", { desc = "Save file", silent = true, noremap = true })
