return {
	-- WhichKey: mostra atalhos disponíveis
	{
		"folke/which-key.nvim",
		event = "BufReadPre", -- Carrega antes para melhor experiência
		config = function()
			require("which-key").setup({
				-- Configurações personalizadas, se desejar
				plugins = { marks = true, registers = true },
				window = { border = "single" },
			})
		end,
	},

	-- Harpoon: navegação rápida entre arquivos favoritos
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			-- Keymaps Harpoon
			local keymap = vim.keymap.set
			keymap("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon add file", noremap = true, silent = true })
			keymap("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon menu", noremap = true, silent = true })
			keymap("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon file 1", noremap = true, silent = true })
			keymap("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon file 2", noremap = true, silent = true })
			keymap("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon file 3", noremap = true, silent = true })
			keymap("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon file 4", noremap = true, silent = true })
		end,
	},

	-- Comment.nvim: comentar/descomentar linhas rapidamente
	{
		"numToStr/Comment.nvim",
		event = "BufReadPre", -- Carrega antes para melhor experiência
		config = function()
			require("Comment").setup()
			vim.keymap.set("n", "<leader>/", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Toggle comment", noremap = true, silent = true })
		end,
	},

	-- AutoPairs: fecha parênteses, chaves, etc. automaticamente
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				-- Configurações personalizadas, se desejar
				check_ts = true, -- Integração com treesitter
			})
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
			keymap(
				"n",
				"<leader>cf",
				"<cmd>Trouble diagnostics toggle<cr>",
				{ desc = "Diagnostics (Trouble)", noremap = true, silent = true }
			)
			keymap(
				"n",
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				{ desc = "Buffer Diagnostics (Trouble)", noremap = true, silent = true }
			)
			keymap(
				"n",
				"<leader>xl",
				"<cmd>Trouble loclist toggle<cr>",
				{ desc = "Location List (Trouble)", noremap = true, silent = true }
			)
			keymap(
				"n",
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				{ desc = "Quickfix List (Trouble)", noremap = true, silent = true }
			)
		end,
	}, -- Removida vírgula extra, se aplicável
}
