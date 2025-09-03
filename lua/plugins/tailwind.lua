return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*",          -- aplica em todas as linguagens
    }, {
      RGB = true,   -- #RGB
      RRGGBB = true, -- #RRGGBB
      names = true, -- "Blue" etc
      RRGGBBAA = true, -- #RRGGBBAA
      rgb_fn = true, -- rgb(255, 0, 0)
      hsl_fn = true, -- hsl(120, 100%, 50%)
      css = true,   -- CSS keywords
      css_fn = true, -- CSS functions
    })
  end,
}
