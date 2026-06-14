local cmp = require("cmp")

return {
	completion = cmp.config.window.bordered({
		border = {
			"󰐖",
			"─",
			"󰐘",
			"│",
			"󰐘",
			"─",
			"󰐖",
			"│",
		},

		winhighlight =
			"Normal:CmpMenu,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
	}),

	documentation = cmp.config.window.bordered({
		border = {
			"󰐖",
			"─",
			"󰐘",
			"│",
			"󰐘",
			"─",
			"󰐖",
			"│",
		},

		winhighlight =
			"Normal:CmpDoc,FloatBorder:CmpBorder,Search:None",
	}),
}
