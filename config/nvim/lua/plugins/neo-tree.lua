return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "-", ":Neotree toggle reveal<CR>", { desc = "Toggle Neotree" })
		vim.keymap.set("n", "<LEADER>b", ":Neotree toggle buffers right<CR>", { desc = "Toggle Buffers" })
		vim.keymap.set("n", "<LEADER>r", ":Neotree float git_status<CR>", { desc = "Toggle Git Status" })
	end,
}
