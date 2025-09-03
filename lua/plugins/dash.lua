return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Logo em ASCII
    dashboard.section.header.val = {
      [[   _   _                 _           ]],
      [[  | \ | |               (_)          ]],
      [[  |  \| | ___  _____   ___ _ __ ___  ]],
      [[  | . ` |/ _ \/ _ \ \ / / | '_ ` _ \ ]],
      [[  | |\  |  __/ (_) \ V /| | | | | | |]],
      [[  |_| \_|\___|\___/ \_/ |_|_| |_| |_|]],
    }

    -- Botões
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer opcional
    dashboard.section.footer.val = "⚡ Config powered by LazyVim ⚡"

    alpha.setup(dashboard.opts)
  end,
}
