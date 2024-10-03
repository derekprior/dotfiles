return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"git_config",
				"gitignore",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"regex",
				"ruby",
				"rust",
				"sql",
				"tmux",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
