return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        render_limit = 4, -- quantas mensagens simultâneas mostra
        done_ttl = 2, -- tempo que mensagens de "done" ficam visíveis
      },
    },
    notification = {
      override_vim_notify = false, -- substitui :echo com popup mais bonito
      window = {
        winblend = 0,          -- transparência
      },
    },
  },
} -- options
