return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lista de servidores
      local servers = {
        "lua_ls",
        "pyright",
        "phpactor",
        "ts_ls", 
        "cssls",
        "html",
        "tailwindcss",
        "cssls",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({})
      end
    end,
  },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
}
