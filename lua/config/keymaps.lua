-- keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Formatação
map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Diagnósticos
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>d", vim.diagnostic.open_float, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Mapeamento para fechar todos os buffers exceto o atual
map("n", "<leader>bc", "<Cmd>BufferlineCloseOthers<CR>", { desc = "Fechar outros buffers" })
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

-- Adicione estas linhas ao seu arquivo de configuração
vim.keymap.set("n", "<leader>t", ":split term<CR>", { noremap = true, silent = true, desc = "Abrir terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, desc = "Sair do modo terminal" })

-- Insert mode escape
map("i", "jk", "<Esc>", opts)
