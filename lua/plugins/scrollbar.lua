return {
  "petertriho/nvim-scrollbar",
  config = function()
    -- 1. Definição centralizada e independente das cores de destaque
    local Colors = {
      -- Cores básicas
      BLACK = "#000000",
      WHITE = "#ffffff",
      
      -- Cores para os marcadores (Scrollbar Marks)
      RED    = "#e06c75",   -- Usado para Erros
      GREEN  = "#98c379",   -- Usado para Diversos (Misc)
      YELLOW = "#e5c07b",   -- Usado para Avisos (Warn)
      BLUE   = "#61afef",   -- Usado para o Handle
      PURPLE = "#c678dd",   -- Usado para Dicas (Hint)
      CYAN   = "#56b6c2",   -- Usado para Informações (Info)
      ORANGE = "#d19a66",   -- Usado para Busca (Search)
    }

    require("scrollbar").setup({
      handle = {
        color = Colors.BLUE,
        cursor_color = Colors.WHITE,
      },
      
      marks = {
        Search = { color = Colors.ORANGE },
        Error  = { color = Colors.RED },
        Warn   = { color = Colors.YELLOW },
        Info   = { color = Colors.CYAN },
        Hint   = { color = Colors.PURPLE },
        Misc   = { color = Colors.GREEN },
      },
      -- Opcional: exibe a barra apenas na janela ativa para reduzir distrações
      show_in_active_only = true, 
    })
  end,
}

