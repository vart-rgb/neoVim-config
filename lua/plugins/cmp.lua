return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "norcalli/nvim-colorizer.lua",
    },
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "saadparwaiz1/cmp_luasnip",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      }

      local source_icons = {
        buffer = "",
        nvim_lsp = "",
        luasnip = kind_icons.Snippet,
        nvim_lua = "",
        path = "",
      }

      -- Tailwind formatter
      local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

      local custom_formatter = function(entry, vim_item)
        -- A. Kind (tipo)
        local kind_icon = kind_icons[vim_item.kind] or ""
        vim_item.kind = string.format("%s %s", kind_icon, vim_item.kind)

        -- B. Fonte (menu)
        local source_name = entry.source.name
        local menu_text = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          path = "[Path]",
        })[source_name] or "[" .. source_name .. "]"

        local source_icon = source_icons[source_name] or ""
        vim_item.menu = string.format("%s %s", source_icon, menu_text)

        -- C. Tailwind color preview
        return tailwind_formatter(entry, vim_item)
      end

      -- Configuração dos plugins
      require("luasnip.loaders.from_vscode").lazy_load()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
      require("luasnip").filetype_extend("php", { "html" })
      require("colorizer").setup({
        "*",
        css = { css = true },
        html = { names = true },
      })

      -- Configuração do nvim-cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.select_next_item(),
          ["<C-a>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = custom_formatter,
        },
      })
    end,
  },
}
