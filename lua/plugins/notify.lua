return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade", -- animação simples
      timeout = 1000,  -- some rápido (1 segundo)
      background_colour = "#007bff",
      render = "minimal", -- estilo clean
    })
    vim.notify = require("notify")
  end,
}
