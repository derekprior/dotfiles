return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Neotree" },
	keys = {
		{ "-", "<CMD>Neotree toggle reveal<CR>", desc = "Toggle Neotree" },
		{ "<LEADER>b", "<CMD>Neotree toggle buffers right<CR>", desc = "Toggle Buffers" },
		{ "<LEADER>r", "<CMD>Neotree float git_status<CR>", desc = "Toggle Git Status" },
	},
	opts = {
		close_if_last_window = true,
	},
}
