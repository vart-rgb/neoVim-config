return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Inicializa Mason
      mason.setup()

      -- Lista dos servidores que desejas garantir
      local servers = {
        "lua_ls",
        "pyright",
        "phpactor",
        "ts_ls",
        "cssls",
        "html",
        "tailwindcss",
        "bashls",
      }

      -- Configura Mason-LSPConfig com autoinstalação
      mason_lspconfig.setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- Usa handlers modernos do mason-lspconfig
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}
