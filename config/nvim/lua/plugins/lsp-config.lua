return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "ts_ls" } },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    end,
  },
}
