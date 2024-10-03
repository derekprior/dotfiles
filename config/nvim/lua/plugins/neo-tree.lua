return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "-", ":Neotree toggle reveal<CR>")
		vim.keymap.set("n", "<LEADER>b", ":Neotree toggle buffers right<CR>")
		vim.keymap.set("n", "<LEADER>r", ":Neotree float git_status<CR>")
	end,
}
