return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = { "html", "cssls", "tailwindcss", "lua_ls" },
				automatic_enable = { exclude = { "jdtls" } },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					-- FORMATTER
					"prettierd",
					"stylua",
					"jq",
					"gofumpt",
					"google-java-format",
					-- LINTER
					"checkstyle",
					"eslint_d",
					"jsonlint",
					"golangci-lint",
				},
			})
		end,
	},
}
