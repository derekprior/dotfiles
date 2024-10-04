vim.g.mapleader = " "

-- whitespace management
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set shiftround")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set nojoinspaces")

-- searching
vim.cmd("set hlsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set incsearch")
vim.keymap.set(
  "n",
  "<leader><CR>",
  ":noh<CR>",
  { desc = "Clear search highlights", silent = true }
)

-- splits
vim.cmd("set winwidth=80")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
vim.keymap.set(
  "n",
  "<leader>o",
  ":only<CR>",
  { desc = "Close all other splits", silent = true }
)

vim.keymap.set(
  "n",
  "<leader>v",
  "<C-w>v",
  { desc = "Split vertically" }
)

-- no folds
vim.cmd("set nofoldenable")

-- no backup files, ever
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")

-- make it obvious where 80 characters is
vim.cmd("set textwidth=80")
vim.cmd("set colorcolumn=+1")

-- line numbers
vim.cmd("set number")
vim.cmd("set numberwidth=4")

-- use OS clipboard
vim.cmd("set clipboard=unnamed")

-- switch between last two files
vim.keymap.set(
  "n",
  "<leader><leader>",
  "<C-^>",
  { desc = "Switch between last two files" }
)

-- beef up those window separators
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#191a21", bold = true })
vim.opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}
