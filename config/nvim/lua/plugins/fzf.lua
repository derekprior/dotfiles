return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		local actions = require("fzf-lua").actions

		fzf.setup({
			"max-perf",
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-z"] = "abort",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					["ctrl-d"] = "preview-page-down",
					["ctrl-u"] = "preview-page-up",
					["ctrl-q"] = "select-all+accept",
				},
			},
			actions = {
				files = {
					["enter"] = actions.file_edit_or_qf,
					["ctrl-x"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["alt-q"] = actions.file_sel_to_qf,
				},
			},
		})
	end,
	cmd = { "FzfLua" },
	keys = {
		{ "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
		{ "<leader>ff", "<cmd>FzfLua<CR>", desc = "Find with FzF" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Search files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
		{ "<leader>fs", "<cmd>FzfLua git_status<CR>", desc = "Find status" },
		{ "<leader>fc", "<cmd>FzfLua git_commits<CR>", desc = "Find commits" },
		{ "<leader>fh", "<cmd>FzfLua git_bcommits<CR>", desc = "Find history" },
	},
}
