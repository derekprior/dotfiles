return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        javascriptreact = { "template_string" },
        typescript = { "template_string" },
        typescriptreact = { "template_string" },
        vue = { "template_string" },
        html = { "template_string" },
        css = { "template_string" },
        scss = { "template_string" },
        less = { "template_string" },
        json = { "template_string" },
        graphql = { "template_string" },
        markdown = { "fence" },
      },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
