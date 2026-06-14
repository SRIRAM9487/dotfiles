local cmp = require("cmp")

----------------------------------------------------------------------
-- ":" command completion
----------------------------------------------------------------------
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),

	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})

----------------------------------------------------------------------
-- "/" and "?" search completion
----------------------------------------------------------------------
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),

	sources = {
		{ name = "buffer" },
	},
})
