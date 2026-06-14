return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {

		-- Snippet engine
		"L3MON4D3/LuaSnip",

		-- CMP sources
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		-- Snippet collection
		"rafamadriz/friendly-snippets",

		-- Completion item icons
		"onsails/lspkind.nvim",
	},

	config = function()
		require("plugins.cmp.setup")
		require("luasnip.loaders.from_vscode").lazy_load()

		require("luasnip").config.setup({})
	end,
}
