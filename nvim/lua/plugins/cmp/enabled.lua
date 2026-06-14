local context = require("cmp.config.context")

return function()
	-- disable in prompt buffers
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")

	if buftype == "prompt" then
		return false
	end

	-- disable in neo-tree
	local filetype = vim.bo.filetype

	if filetype == "neo-tree" or filetype == "neo-tree-popup" then
		return false
	end

	-- always enable in command mode
	if vim.api.nvim_get_mode().mode == "c" then
		return true
	end

	-- disable inside comments
	return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
end
