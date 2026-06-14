local lspkind = require("lspkind")

return {
	format = lspkind.cmp_format({
		mode = "symbol",

		maxwidth = 50,

		ellipsis_char = "…",
	}),
}
