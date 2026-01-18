return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
	opts = {

		show_dirname = true,
		show_basename = true,
		show_modified = true,

		separator = "",
		attach_navic = true,

		exclude_filetypes = {
			"terminal",
			"toggleterm",
			"NvimTree",
			"neo-tree",
			"dashboard",
			"alpha",
		},

		theme = {
			normal = { fg = "#c0caf5" },
			ellipsis = { fg = "#737aa2" },
			separator = { fg = "#737aa2" },
			modified = { fg = "#737aa2" },
			dirname = { fg = "#737aa2" },
			basename = { bold = true },

			context = { fg = "#ac8fe4" },
		},
	},
}
