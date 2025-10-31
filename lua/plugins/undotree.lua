-- lua/plugins/undotree.lua
return {
  "mbbill/undotree",
  config = function()
    local undodir = vim.fn.getcwd() .. "/.undodir"

    -- cria o diretório caso não exista
    if vim.fn.isdirectory(undodir) == 0 then
      vim.fn.mkdir(undodir, "p")
    end

    -- ativa undo persistente
    vim.opt.undofile = true
    vim.opt.undodir = undodir

    -- keymap pra abrir/fechar undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
