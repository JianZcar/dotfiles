local servers = { "lua_ls", "html", "cssls", "ts_ls", "pylsp", "omnisharp" }

vim.diagnostic.config({
  virtual_text = true,    -- show inline diagnostics
  signs = false,          -- show signs in the gutter
  update_in_insert = true,
})

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = servers })
require("trouble").setup()
