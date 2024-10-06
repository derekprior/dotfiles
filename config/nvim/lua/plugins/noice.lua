return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "written" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
            { find = "%d lines <ed %d time[s]?" },
            { find = "%d lines >ed %d time[s]?" },
            { find = "%d lines yanked" },
          },
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    { "MunifTanjim/nui.nvim" },
    { "rcarriga/nvim-notify" },
  },
}
