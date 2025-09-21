return {
  "mbbill/undotree",
  keys = {
    -- Abrir / fechar a Undotree
    { "<F5>", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },

    -- Guardar mudanças persistentes
    { "<leader>us", function()
        vim.opt.undofile = true
        vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
        vim.fn.mkdir(vim.opt.undodir:get(), "p")
        vim.notify("Undo persistente ativado! ✔️", vim.log.levels.INFO)
      end,
      desc = "Ativar undo persistente"
    },
  },
  config = function()
    -- Ativar histórico persistente por padrão
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
    vim.fn.mkdir(vim.opt.undodir:get(), "p")
  end,
}
