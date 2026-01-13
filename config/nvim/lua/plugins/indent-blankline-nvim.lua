return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local indent = require("ibl")
		indent.setup({ enabled = true, indent = { char = "|" } })
	end,
}
