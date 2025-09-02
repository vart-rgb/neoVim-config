return {
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "pyright", "phpactor", "ts_ls", "cssls", "html" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {}
      end
    end
  },
}
