return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local ibl = require("ibl")

		ibl.setup({
			enabled = true,
			indent = { char = "▏" },
			scope = { enabled = true, show_start = false, show_end = false },
			whitespace = { remove_blankline_trail = true },
		})
	end,
}
