return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "GBrowse" },
    keys = {
      { "<leader>gb", "<CMD>Git blame<CR>", desc = "git blame" },
    },
  },
  {
    "tpope/vim-rhubarb",
    cmd = { "GBrowse" },
    keys = {
      { "<leader>go", "<CMD>GBrowse<CR>", desc = "git browse" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    opts = {},
    lazy = false,
    keys = {
      { "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", desc = "git diff hunk" },
      { "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>",   desc = "git reset diff hunk" },
      { "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", desc = "git reset buffer" },
    },
  },
}
