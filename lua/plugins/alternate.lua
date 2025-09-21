return {
	-- WhichKey: mostra atalhos
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
		end,
	},

	-- Harpoon: favoritos rápidos
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- versão nova
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Keymaps Harpoon
			local keymap = vim.keymap.set
			keymap("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon add file" })
			keymap("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon menu" })
			keymap("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon file 1" })
			keymap("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon file 2" })
			keymap("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon file 3" })
			keymap("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon file 4" })
		end,
	},

	-- Comment.nvim: comentar rápido
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
			-- Keymap extra (já vem com gc)
			vim.keymap.set("n", "<leader>/", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Toggle comment" })
		end,
	},

	-- AutoPairs: fecha parênteses/chaves
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
    end,
  }, 


-- Trouble: painel de diagnostics/LSP
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		opts = {},
		config = function(_, opts)
			local trouble = require("trouble")
			trouble.setup(opts)

			-- Keymaps Trouble
			local keymap = vim.keymap.set
			keymap("n", "<leader>cf", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
			keymap(
				"n",
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				{ desc = "Buffer Diagnostics (Trouble)" }
			)
			keymap("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
			keymap("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
		end,
	},
}
