return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	opts = {
		options = {
			mode = "tabs",
			numbers = "none",
			separator_style = "thin",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			offsets = { { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", separator = true } },
		},
	},
}
