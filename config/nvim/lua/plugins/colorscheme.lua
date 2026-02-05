return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,

			custom_highlights = function(colors)
				return {
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },
					Pmenu = { bg = "NONE" },
					TelescopeNormal = { bg = "NONE" },
					TelescopeBorder = { bg = "NONE" },
					NvimTreeNormal = { bg = "NONE" },
					NeoTreeNormal = { bg = "NONE" },
					NormalNC = { bg = "NONE" },
					EndOfBuffer = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
