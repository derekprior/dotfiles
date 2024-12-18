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
		cmd = { "G", "Git", "GBrowse", "Gread", "GDelete", "GMove", "GRename" },
		keys = {
			{ "<leader>gb", "<CMD>Git blame<CR>", desc = "git blame" },
		},
	},
	{
		"tpope/vim-rhubarb",
		cmd = { "GBrowse" },
		dependencies = { "tpope/vim-fugitive" },
		keys = {
			{ "<leader>go", "<CMD>GBrowse<CR>", desc = "git browse" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		cmd = { "Gitsigns" },
		opts = {},
		event = { "BufReadPre" },
		keys = {
			{ "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", desc = "git diff hunk" },
			{ "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", desc = "git reset diff hunk" },
			{ "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", desc = "git reset buffer" },
			{ "[h", "<CMD>Gitsigns prev_hunk<CR>", desc = "git prev hunk" },
			{ "]h", "<CMD>Gitsigns next_hunk<CR>", desc = "git next hunk" },
		},
	},
}
