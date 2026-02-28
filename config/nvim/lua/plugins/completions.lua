return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = { "Copilot" },
		build = ":Copilot auth",
		opts = {
			panel = {
				enabled = false,
			},
			suggestion = {
				auto_trigger = true,
			},
			filetypes = {
				markdown = true,
				gitcommit = true,
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				preset = "default",
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-e>"] = { "cancel", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					function(cmp)
						local copilot = require("copilot.suggestion")
						if copilot.is_visible() then
							copilot.accept()
							return true
						end
						if cmp.is_visible() then
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},
			completion = {
				menu = { border = "rounded" },
				documentation = {
					auto_show = true,
					window = { border = "rounded" },
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
