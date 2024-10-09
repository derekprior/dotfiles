return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = { "Copilot" },
		build = ":Copilot auth",
		opts = {
			suggestion = { auto_trigger = "true" },
			filetypes = { markdown = true, gitcommit = true },
		},
	},
}
