return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			require("neo-tree").setup({
				sources = {
					"filesystem",
					"document_symbols",
				},
				source_selector = {
					winbar = true,
					statusline = false,
					sources = {
						{ source = "filesystem", display_name = "  Files " },
						{ source = "document_symbols", display_name = "  Symbols " },
					},
				},
			})
		end,
	},
}
