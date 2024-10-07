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
  {
    "AndreM222/copilot-lualine",
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")


      lualine.setup({
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            {
              "copilot",
              show_colors = true
            },
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  },
}
