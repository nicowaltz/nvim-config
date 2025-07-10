local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "<C-c>", "ggVGy", { desc = "Yank entire file" })

map("n", "MM", function()
	vim.fn.search("[A-Z_]", "bW")
end, { desc = "Last capital letter or underscore" })

map("v", "MM", function()
	vim.fn.search("[A-Z_]", "bW")
end, { desc = "Last capital letter or underscore" })

map("x", "MM", function()
	vim.fn.search("[A-Z_]", "bW")
end, { desc = "Last capital letter or underscore" })

map("o", "MM", function()
	vim.fn.search("[A-Z_]", "bW")
end, { desc = "Last capital letter or underscore" })

map("n", "mm", function()
	vim.fn.search("[A-Z_]", "W")
end, { desc = "Next capital letter or underscore" })

map("v", "mm", function()
	vim.fn.search("[A-Z_]", "W")
end, { desc = "Next capital letter or underscore" })

map("x", "mm", function()
	vim.fn.search("[A-Z_]", "W")
end, { desc = "Next capital letter or underscore" })

map("o", "mm", function()
	vim.fn.search("[A-Z_]", "W")
end, { desc = "Next capital letter or underscore" })

map(
	"n",
	"<leader>dd",
	"<cmd> lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>",
	{ desc = "LSP open diagnostic" }
)
map("n", "<leader>dn", "<cmd> lua vim.diagnostic.goto_next({ wrap = true })<CR>", { desc = "LSP next diagnostic" })
map("n", "<leader>db", "<cmd> lua vim.diagnostic.goto_prev({ wrap = true })<CR>", { desc = "LSP previous diagnostic" })
map("i", "jk", "<ESC>")

-- move lines
map("n", "<C-j>", ":m .+1<CR>==", { desc = "move line down" })
map("n", "<C-k>", ":m .-2<CR>==", { desc = "move line up" })

map("n", "<leader>dn", "<cmd> lua vim.diagnostic.goto_next({ wrap = true })<CR>", { desc = "LSP next diagnostic" })
map("n", "<leader>db", "<cmd> lua vim.diagnostic.goto_prev({ wrap = true })<CR>", { desc = "LSP previous diagnostic" })

map("i", "jk", "<ESC>")

map("n", "<leader>e", "<cmd>NvimTreeFocus<cr>")
map("n", "<leader>b", "<cmd>new<cr>")
map("n", "<leader>t", "<cmd>tabnew<cr>")
map("n", "<tab>", "<cmd>tabnext<cr>")
map("n", "<S-tab>", "<cmd>tabprev<cr>")
map("n", "<leader>sh", "<cmd>sp<cr>")
map("n", "<leader>sv", "<cmd>vsp<cr>")
map("n", "<leader>v", "<cmd>vnew<cr>")
map("n", "<leader>x", "<C-w>c")

map("t", "<C-x>", "<C-\\><C-n>")
