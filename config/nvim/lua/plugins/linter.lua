return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },
			java = { "checkstyle" },
			javascript = { "eslint_d" },
			json = { "jsonlint" },
			dockerfile = { "hadolint" },
		}
	end,
}
