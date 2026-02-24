return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
		auto_close = true,
		auto_preview = false,
		warn_no_results = false,
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "diagnostics toggle",
		},
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics",
		},
	},
}
