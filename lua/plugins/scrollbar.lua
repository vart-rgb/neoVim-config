return {
	"petertriho/nvim-scrollbar",
	config = function()
		-- Cores definidas manualmente para garantir a independência de tema.
		local M = {}

		-- Cores do terminal (cores básicas, genéricas para todos os temas)
		M.black = "#000000"
		M.white = "#ffffff"
		M.red = "#e06c75"
		M.green = "#98c379"
		M.yellow = "#e5c07b"
		M.blue = "#61afef"
		M.purple = "#c678dd"
		M.cyan = "#56b6c2"
		M.orange = "#d19a66"

		-- Cores para a barra de rolagem
		local scroll_colors = {
			handle = M.blue,
			search = M.orange,
			error = M.red,
			warning = M.yellow,
			info = M.cyan,
			hint = M.purple,
			misc = M.green,
		}

		require("scrollbar").setup({
			handle = {
				color = scroll_colors.handle,
			},
			marks = {
				Search = { color = scroll_colors.search },
				Error = { color = scroll_colors.error },
				Warn = { color = scroll_colors.warning },
				Info = { color = scroll_colors.info },
				Hint = { color = scroll_colors.hint },
				Misc = { color = scroll_colors.misc },
			},
		})
	end,
}
