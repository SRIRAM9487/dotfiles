return {
	{
		"williamboman/mason.nvim",
		opts = { ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls", -- LUA
				"html", -- HTML
				"cssls", -- CSS
				"ts_ls", -- JAVA SCRIPT
				"tailwindcss", -- TAILWIND
				"jdtls", --- JAVA
				"lemminx", --- XML
				"clangd", --- c
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {

				-- FORMATTER
				"prettierd",
				"google-java-format",
				"prettierd",
				"stylua",
				"clang-format",
				"jq",
				"pgformatter",

				-- -- LINTER
				-- "luacheck",
				-- "checkstyle",
				-- "eslint_d",
				-- "cpplint",
				-- "jsonlint",

				-- -- TEST
				-- "java-test",

				-- -- DAP
				-- "java-debug-adapter",
			},
		},
	},
}
