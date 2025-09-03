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
        "ts_ls", -- ajustei o nome correto, era "tsserver"
        "cssls",
        "html",
        "tailwindcss", -- 👈 acrescentei o Tailwind
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({})
      end
    end,
  },
  { "williamboman/mason.nvim",          config = true },
  { "williamboman/mason-lspconfig.nvim" },
}
