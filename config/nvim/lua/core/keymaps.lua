local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader><CR>", ":noh<CR>", { desc = "Clear search highlights", silent = true })
keymap.set("n", "<leader>o", ":only<CR>", { desc = "Close all other splits", silent = true })
keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Switch between last two files" })
