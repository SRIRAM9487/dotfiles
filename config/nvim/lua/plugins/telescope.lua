return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"target",
					".target",
					".class",
				},
			},
			extensions = {
				["ui-select"] = themes.get_dropdown({}),
			},
		})

		telescope.load_extension("ui-select")
	end,
}
