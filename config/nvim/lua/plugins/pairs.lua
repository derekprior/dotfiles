return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			javascriptreact = { "template_string" },
			typescript = { "template_string" },
			typescriptreact = { "template_string" },
			markdown = { "fence" },
		},
	},
}
