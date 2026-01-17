local M = {}

function M.format_code()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end

function M.lint_code()
	require("lint").try_lint()
end

function M.nvim_tree_toggle()
	vim.cmd("Neotree toggle filesystem left reveal")
end

function M.nvim_tree_focus()
	vim.cmd("Neotree focus filesystem left reveal")
end

function M.next_todo()
	require("todo-comments").jump_next()
end

function M.prev_todo()
	require("todo-comments").jump_prev()
end

function M.telescope_find_files()
	require("telescope.builtin").find_files()
end

function M.telescope_show_methods()
	require("telescope.builtin").treesitter({ symbols = { "function", "method" } })
end

function M.organize_imports()
	if vim.bo.filetype == "java" then
		require("jdtls").organize_imports()
	end
end

function M.test_current_class()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end

function M.test_nearest_method()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end

function M.update_projects_config()
	if vim.bo.filetype == "java" then
		require("jdtls").update_projects_config()
	end
end

return M
