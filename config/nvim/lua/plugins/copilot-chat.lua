return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	opts = {
		model = "claude-3.5-sonnet",
	},
	cmd = {
		"CopilotChat",
		"CopilotChatToggle",
		"CopilotChatAgents",
		"CopilotChatModels",
		"CopilotChatExplain",
		"CopilotChatReview",
		"CopilotChatFix",
		"CopilotChatOptimize",
		"CopilotChatDocs",
		"CopilotChatTests",
		"CopilotChatCommit",
	},
	keys = {
		{ "<leader>aa", "<cmd>CopilotChatToggle<CR>", desc = "Toggle AI Chat" },
		{ "<leader>ae", "<cmd>CopilotChatExplain<CR>", mode = { "v", "n" }, desc = "AI Explain" },
		{ "<leader>ar", "<cmd>CopilotChatReview<CR>", mode = { "v", "n" }, desc = "AI Review" },
		{ "<leader>af", "<cmd>CopilotChatFix<CR>", mode = { "v", "n" }, desc = "AI Fix" },
		{ "<leader>ao", "<cmd>CopilotChatOptimize<CR>", mode = { "v", "n" }, desc = "AI Optimize" },
		{ "<leader>at", "<cmd>CopilotChatTests<CR>", mode = { "v", "n" }, desc = "AI Tests" },
		{ "<leader>am", "<cmd>CopilotChatModels<CR>", mode = { "v", "n" }, desc = "AI Models" },
		{ "<leader>ax", "<cmd>CopilotChatReset<CR>", desc = "AI Chat Reset" },
	},
}
