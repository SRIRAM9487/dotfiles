local M = {}

-- formatter
function M.format_code()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end

-- linter
function M.lint_code()
	require("lint").try_lint()
end

-- nvim tree
function M.nvim_tree_toggle()
	vim.cmd("Neotree toggle filesystem left reveal")
end

function M.nvim_tree_focus()
	vim.cmd("Neotree focus filesystem left reveal")
end

-- todo
function M.next_todo()
	require("todo-comments").jump_next()
end

function M.prev_todo()
	require("todo-comments").jump_prev()
end

-- telescope
function M.telescope_find_files()
	require("telescope.builtin").find_files()
end

function M.telescope_show_methods()
	require("telescope.builtin").treesitter({ symbols = { "function", "method" } })
end

return M
