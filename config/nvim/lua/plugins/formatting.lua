return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			json = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			ruby = function()
				local function has_standard()
					local standard_yml = io.open("standard.yml")
					if standard_yml then
						standard_yml:close()
						return true
					end

					local gemfile = io.open("Gemfile")
					if gemfile then
						local content = gemfile:read("*all")
						gemfile:close()
						if content:match('gem "standard"') or content:match("gem 'standard'") then
							return true
						end
					end

					local gemspecs = vim.fn.glob("*.gemspec")
					if gemspecs ~= "" then
						for gemspec in string.gmatch(gemspecs, "[^\n]+") do
							local file = io.open(gemspec)
							if file then
								local content = file:read("*all")
								file:close()
								if content:match('add_development_dependency "standard"') or content:match("add_development_dependency 'standard'") then
									return true
								end
							end
						end
					end

					return false
				end

				if has_standard() then
					return { "standardrb" }
				else
					return { "rubocop" }
				end
			end,
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
