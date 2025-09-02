return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- Habilita a integração com o Neo-tree
    on_attach = function(bufnr)
      vim.g.gitsigns_status_dict = {}
      vim.g.gitsigns_status_dict[bufnr] = "on"
    end,
  },
}

