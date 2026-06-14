local cmp = require("cmp")

-- Completion sources (with priorities)
return cmp.config.sources({
  
	-- lsp
	{
		name = "nvim_lsp",
		priority = 10000,
	},

	-- current buffer words
	{
		name = "buffer",
		priority = 500,

		option = {
			get_bufnrs = function()
				return { vim.api.nvim_get_current_buf() }
			end,
		},
	},

	-- filesystem paths
	{
		name = "path",
		priority = 8000,
	},

	-- snippets
	{
		name = "luasnip",
		priority = 7000,
	},
})
