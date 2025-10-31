-- Definindo cores para rainbow indent (adapte as cores se quiser)
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E41212" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#000099" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#3F9D41" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#8C8EE7" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    enabled = true,                -- garante que o plugin está ativo
    debounce = 100,                -- intervalo de atualização em ms (padrão é 200)
    viewport_buffer = { min = 100 }, -- quantas linhas acima/abaixo gerar guias

    indent = {
      char = "│", -- caractere do guia de indentação
      tab_char = "", -- caractere para tabulação (pode trocar)
      highlight = { "Function", "Label" }, -- grupos de highlight para as guias
      smart_indent_cap = true, -- ajusta o cap de indentação pelo código
      priority = 2, -- prioridade do texto virtual
      repeat_linebreak = false, -- repete guia em linha quebrada (Nvim 0.10+)
    },

    whitespace = {
      highlight = { "Whitespace", "NonText" }, -- grupo de highlight para espaços
      remove_blankline_trail = true,        -- mantém espaços em branco em linhas vazias
    },

    scope = {
      enabled = true,                   -- ativa destaque de escopo (requer Treesitter)
      show_start = true,                -- mostra início do escopo
      show_end = true,                  -- mostra fim do escopo
      highlight = { "Function", "Label" }, -- grupo de cores para o escopo
      exclude = { language = { "lua" } }, -- não mostra escopo em arquivos Lua
    },
    exclude = {
      filetypes = { "help", "dashboard", "NvimTree" }, -- tipos de arquivo a ignorar
      buftypes = { "terminal", "nofile" },          -- tipos de buffer a ignorar
    },
  },
}
