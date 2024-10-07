local opt = vim.opt
local keymap = vim.keymap

vim.g.mapleader = " "

-- whitespace management
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.wrap = false
opt.joinspaces = false
opt.autoindent = true

-- searching
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
keymap.set(
  "n",
  "<leader><CR>",
  ":noh<CR>",
  { desc = "Clear search highlights", silent = true }
)

-- splits
opt.winwidth = 80
opt.splitbelow = true
opt.splitright = true
keymap.set(
  "n",
  "<leader>o",
  ":only<CR>",
  { desc = "Close all other splits", silent = true }
)

keymap.set(
  "n",
  "<leader>v",
  "<C-w>v",
  { desc = "Split vertically" }
)

-- no folds
opt.foldenable = false

-- no backup files, ever
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- make it obvious where 80 characters is
opt.textwidth = 80
opt.colorcolumn = "+1"

-- line numbers
opt.number = true
opt.numberwidth = 4

-- use OS clipboard
opt.clipboard = "unnamed"

-- switch between last two files
keymap.set(
  "n",
  "<leader><leader>",
  "<C-^>",
  { desc = "Switch between last two files" }
)

-- beef up those window separators
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#191a21", bold = true })
opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}
