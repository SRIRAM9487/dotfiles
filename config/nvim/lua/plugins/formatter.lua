return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {

		formatters_by_ft = {

			html = { "prettierd" },
			css = { "prettierd" },

			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },

			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },

			java = { "google-java-format" },
			yaml = { "prettierd" },

			lua = { "stylua" },
			json = { "jq" },
			sql = { "pgformatter" },
		},
		format_on_save = { lsp_fallback = true, async = false, timeout_ms = 3000 },
	},
}
