return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      -- Linguagens que tu quer suporte
      ensure_installed = { "lua", "python", "php", "javascript", "html", "css" },

      -- Ativa o highlight poderoso do tree-sitter
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Indentação automática inteligente
      indent = {
        enable = true,
      },
    }
  end
}
