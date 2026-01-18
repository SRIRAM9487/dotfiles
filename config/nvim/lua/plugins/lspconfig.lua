return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre" },
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
		{ "mfussenegger/nvim-jdtls", ft = "java" },
	},
	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config.default_config = { capabilities = lsp_capabilities }
		vim.diagnostic.config({ float = { border = "rounded" } })
	end,
}
