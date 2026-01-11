vim.g.mapleader = " "
local keymap = vim.keymap

-- Formatter
keymap.set({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Linter
keymap.set("n", "<leader>cl", function()
	require("lint").try_lint()
end, { desc = "Run linters" })

-- NVIM TREE
keymap.set("n", "<leader>nt", function()
	vim.cmd("Neotree toggle filesystem left reveal")
end, { noremap = true, silent = true })

keymap.set("n", "<leader>nf", function()
	vim.cmd("Neotree focus filesystem left reveal")
end, { noremap = true, silent = true })

-- Todo Comments --
keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "fuzzy find files in project" })
keymap.set(
	"n",
	"<leader>fs",
	require("telescope.builtin").current_buffer_fuzzy_find,
	{ desc = "fuzzy find in current file buffer" }
)
keymap.set(
	"n",
	"<leader>fo",
	require("telescope.builtin").lsp_document_symbols,
	{ desc = "fuzzy find LSP/class symbols" }
)
keymap.set("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ symbols = { "function", "method" } })
end, { desc = "show method in current file" })

----------- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set({ "n", "v" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

---------- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle maximize tab" })

---------- Filetype-specific --

keymap.set("n", "<leader>go", function()
	if vim.bo.filetype == "java" then
		require("jdtls").organize_imports()
	end
end)

keymap.set("n", "<leader>gu", function()
	if vim.bo.filetype == "java" then
		require("jdtls").update_projects_config()
	end
end)
