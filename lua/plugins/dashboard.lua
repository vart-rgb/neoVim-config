return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "                   neoVim 🚀",
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "📄  Novo arquivo", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "🔍  Procurar arquivo", ":Telescope find_files<CR>"),
        dashboard.button("r", "📂  Arquivos recentes", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "❌  Sair", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  }
}
