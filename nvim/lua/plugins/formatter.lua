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
			c = { "clang-format" },

			lua = { "stylua" },
			json = { "jq" },
			jsonc = { "jq" },
			sql = { "pg_format" },

		},
	},
}
