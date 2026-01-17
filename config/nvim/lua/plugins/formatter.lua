return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				html = { "prettierd" },
				css = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "jq" },
				yaml = { "prettierd" },
				lua = { "stylua" },
				java = { "google-java-format" },
				go = { "gofumpt" },
				sql = { "pgformatter" },
			},
			format_on_save = { lsp_fallback = true, async = false, timeout_ms = 3000 },
		})
	end,
}
