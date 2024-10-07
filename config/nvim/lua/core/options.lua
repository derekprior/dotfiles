local opt = vim.opt

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

-- splits
opt.winwidth = 80
opt.splitbelow = true
opt.splitright = true

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

-- beef up those window separators
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#191a21", bold = true })
opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
