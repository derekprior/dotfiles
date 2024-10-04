return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = { "Copilot" },
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				suggestion = { auto_trigger = "true" },
				filetypes = { markdown = true, gitcommit = true },
			})
		end,
	},
	{
		"AndreM222/copilot-lualine",
		config = function()
			require("lualine").setup({
				sections = {
					lualine_x = {
						{ "copilot", show_colors = true },
						"fileformat",
						"filetype",
					},
				},
			})
		end,
	},
}
