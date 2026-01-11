return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			java = { "checkstyle" },
			lua = { "luacheck" },
			javascript = { "eslint_d" },
			json = { "jsonlint" },
			docker = { "hadolint" },
		}

		local augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			group = augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
