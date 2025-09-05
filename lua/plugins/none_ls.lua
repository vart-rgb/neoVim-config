return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				--lua
				null_ls.builtins.formatting.stylua,
				--null_ls.builtins.diagnostics.luacheck,
				--python
				null_ls.builtins.formatting.black,
				--null_ls.builtins.diagnostics.flake8,
				--null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.isort,
				--php
				null_ls.builtins.formatting.phpcsfixer,
				null_ls.builtins.diagnostics.phpcs,
				--js, html,css
				--null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.prettier,
				--só para o css
				null_ls.builtins.diagnostics.stylelint,
			},
      timeout = 5000,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
