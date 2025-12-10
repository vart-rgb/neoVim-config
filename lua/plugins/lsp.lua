return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    -- O 'config' é chamado automaticamente após a instalação bem-sucedida do plugin
    config = function()
      -- 1. Importar Módulos
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      -- Obtém as capabilities padrão para integração com nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 2. Lista de Servidores
      -- Adicionei 'lua_ls' para o seu desenvolvimento em Lua
      local servers = {
        "pyright",
        "phpactor",
        "ts_ls", -- Correção: o nome oficial no Mason é 'tsserver', não 'ts_ls'
        "cssls",
        "html",
        "tailwindcss",
        "bashls",
        "lua_ls",     -- Adicionado para a configuração Lua do NeoVim
      }

      -- 3. Configuração do Mason
      mason.setup()

      -- 4. Configuração do mason-lspconfig
      -- O setup do mason-lspconfig deve vir antes da configuração dos handlers se você quiser
      -- garantir a instalação e configurar handlers customizados.
      mason_lspconfig.setup({
        ensure_installed = servers, -- Garante que todos os servidores na lista sejam instalados
        automatic_installation = true, -- Opção para instalar automaticamente
      })

      -- 5. Configuração dos Handlers (como o lspconfig deve ser configurado para cada servidor)
      mason_lspconfig.setup_handlers({
        -- Handler padrão para a maioria dos servidores:
        -- Configura o servidor usando as capabilities de nvim-cmp
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            -- Outras opções padrão podem ser adicionadas aqui
          })
        end,

        -- Exemplo de Handler Customizado (OPCIONAL):
        -- Para o 'lua_ls', é bom adicionar uma configuração específica para NeoVim.
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                workspace = {
                  -- Certifique-se de que o lsp entenda que estamos no ambiente neovim
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
                -- Configuração específica para NeoVim
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      })
    end,
  },
}

