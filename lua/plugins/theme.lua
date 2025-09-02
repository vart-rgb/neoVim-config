return {
  { "ellisonleao/gruvbox.nvim", priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = true, priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight", lazy = true, priority = 1000 },
  { "dracula/vim", name = "dracula", lazy = true, priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000,
    config = function ()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme = 'oxocarbon'
    end 
  },
  { "navarasu/onedark.nvim", priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end
  }
}
