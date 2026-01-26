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
				"tailwindcss", -- TAILWIND
				"ts_ls", -- JAVA SCRIPT
				"lua_ls", -- LUA
				"jdtls", --- JAVA
				"lemminx", --- XML
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {

				-- FORMATTER
				"prettierd",
				"jq",
				"google-java-format",
				"stylua",
				"pgformatter",

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
