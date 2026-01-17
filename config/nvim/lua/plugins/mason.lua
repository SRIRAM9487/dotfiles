return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"html", -- HTML
				"cssls", -- CSS
				"ts_ls", -- JAVA SCRIPT
				"tailwindcss", -- TAILWIND
				"lua_ls", -- LUA
				--- JAVA ---
				"jdtls", -- LSP
				--- XML ---
				"lemminx", -- LSP
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- FORMATTER
				"prettierd",
				"stylua",
				"jq",
				"google-java-format",
				-- LINTER
				"checkstyle",
				"eslint_d",
				"jsonlint",
				-- TEST
				"java-test",
				-- DAP
				"java-debug-adapter",
			},
		},
	},
}
