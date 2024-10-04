return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  keys = {
    { "-", ":Neotree toggle reveal<CR>", desc = "Toggle Neotree"  },
    { "<LEADER>b", ":Neotree toggle buffers right<CR>", desc = "Toggle Buffers" },
    { "<LEADER>r", ":Neotree float git_status<CR>", desc = "Toggle Git Status" },
  },
}
