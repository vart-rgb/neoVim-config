return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"norcalli/nvim-colorizer.lua",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"saadparwaiz1/cmp_luasnip",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})

			require("luasnip").filetype_extend("php", { "html" })

			require("colorizer").setup({
				"*",
				css = { css = true },
				html = { names = true },
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.select_next_item(),
					["<C-a>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = require("tailwindcss-colorizer-cmp").formatter,
				},
			})
		end,
	},
}
