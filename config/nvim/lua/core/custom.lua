vim.g.mapleader = " "
local keymap = vim.keymap

local actions = require("utils.actions")
local lsp = require("utils.lsp")

------ FORMATTER && LINTER
keymap.set({ "n", "v" }, "<leader>mp", actions.format_code, { desc = "Format file or selected range" })
keymap.set("n", "<leader>cl", actions.lint_code, { desc = "Run linters" })

------ NVIM TREE
keymap.set("n", "<leader>nt", actions.nvim_tree_toggle, { noremap = true, desc = "Toggle file explorer" })
keymap.set("n", "<leader>nf", actions.nvim_tree_focus, { noremap = true, desc = "Focus file explorer" })

------ TODO
keymap.set("n", "]t", actions.next_todo, { desc = "Next TODO comment" })
keymap.set("n", "[t", actions.prev_todo, { desc = "Previous TODO comment" })

------ TELESCOPE
keymap.set("n", "<leader>ff", actions.telescope_find_files, { desc = "Find files (project)" })
keymap.set("n", "<leader>fm", actions.telescope_show_methods, { desc = "Show methods in current file" })

----------- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover documentation" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "List references" })
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
keymap.set({ "n", "v" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format via LSP" })
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show line diagnostics" })
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
keymap.set("n", "<leader>gN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })

---------- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle maximize window" })

---------- Filetype-specific
keymap.set("n", "<leader>go", lsp.organize_imports, { desc = "Organize Java imports" })
keymap.set("n", "<leader>gu", lsp.update_projects_config, { desc = "Update project LSP config" })
keymap.set("n", "<leader>tc", lsp.test_current_class, { desc = "Run tests for current class" })
keymap.set("n", "<leader>tm", lsp.test_nearest_method, { desc = "Run nearest test method" })
