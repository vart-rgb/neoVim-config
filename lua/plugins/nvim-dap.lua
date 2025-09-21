return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")

			dap.adapters.python = {
				type = "executable",
				command = "/data/data/com.termux/files/usr/bin/python",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						-- Usa o mesmo executável para rodar o script
						return "/data/data/com.termux/files/usr/bin/python"
					end,
				},
			}
      dap.adapters.lldb = {
        type = "executable",
				command = "lldb-vscode", -- vem com lldb no Termux
				name = "lldb",
      }
      dap.configurations.c = {
        {
          name = "Debug C",
					type = "lldb",
					request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
        },
      }
      -- dap.configurations.cpp = dap.configurations.c
    -- end,

			require("dapui").setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stack", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 30,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 15,
						position = "bottom",
					},
				},
			})

			local keymap = vim.keymap.set
			local opts = { silent = true }

			keymap("n", "<leader>dt", function()
				require("dapui").toggle()
			end, opts) -- Abre/fecha a interface do debugger
			keymap("n", "<leader>db", function()
				require("dap").toggle_breakpoint()
			end, opts) -- Adiciona/remove breakpoint
			keymap("n", "<leader>dc", function()
				require("dap").continue()
			end, opts) -- Continua a execução
			keymap("n", "<leader>do", function()
				require("dap").step_over()
			end, opts) -- Pula para a próxima linha
			keymap("n", "<leader>di", function()
				require("dap").step_into()
			end, opts) -- Entra na função
			keymap("n", "<leader>du", function()
				require("dap").step_out()
			end, opts) -- Sai da função
			keymap("n", "<leader>dr", function()
				require("dap").repl.open()
			end, opts) -- Abre a linha de comando do debugger
		end,
	},
}
