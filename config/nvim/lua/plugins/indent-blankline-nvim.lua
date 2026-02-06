return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local ibl = require("ibl")
		local hooks = require("ibl.hooks")

		-- Rainbow highlight groups
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			local colors = {
				RainbowRed = "#E06C75",
				RainbowYellow = "#E5C07B",
				RainbowBlue = "#61AFEF",
				RainbowOrange = "#D19A66",
				RainbowGreen = "#98C379",
				RainbowViolet = "#C678DD",
				RainbowCyan = "#56B6C2",
			}

			for group, color in pairs(colors) do
				vim.api.nvim_set_hl(0, group, { fg = color })
			end
		end)

		ibl.setup({
			enabled = true,
			indent = { char = "▏", highlight = highlight },
			scope = { enabled = true, show_start = false, show_end = false, highlight = highlight },
			whitespace = { remove_blankline_trail = true },
		})
	end,
}
