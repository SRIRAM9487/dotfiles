local cmp = require("cmp")

return cmp.mapping.preset.insert({

	["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
	["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion

	["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions

	-- Safer confirm (no accidental commits)
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),

	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			})
		else
			fallback()
		end
	end, { "i", "s" }),
})
