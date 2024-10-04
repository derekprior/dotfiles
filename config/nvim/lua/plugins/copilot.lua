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
    "zbirenbaum/copilot-cmp",
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      lsp_on_attach(function(_)
        copilot_cmp._on_insert_enter({})
      end, "copilot")
    end,

    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
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
