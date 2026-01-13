return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = { { "j-hui/fidget.nvim", opts = {} }, { "folke/neodev.nvim", opts = {} } },
	config = function()
		require("mason-tool-installer").setup({})
		vim.cmd("MasonToolsInstall")

		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(_client, _) end

		vim.lsp.config("*", {
			capabilities = lsp_capabilities,
			on_attach = lsp_attach,
		})

		vim.lsp.config("lua_ls", {
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded"
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
