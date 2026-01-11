return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		signs = true,
		sign_priority = 8,

		keywords = {
			TODO = { icon = " ", color = "info" },
			REV = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			TEST = {
				icon = "⏲ ",
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED" },
			},
		},

		colors = {
			error = { "DiagnosticError", "#ff5f87" }, -- neon pink/red (cyberdream)
			warning = { "DiagnosticWarn", "#f1c40f" }, -- muted neon yellow
			info = { "DiagnosticInfo", "#5fd7ff" }, -- cyberdream blue
			hint = { "DiagnosticHint", "#5fffaf" }, -- mint green
			default = { "Identifier", "#bd93f9" }, -- purple accent
			test = { "Identifier", "#7aa2f7" }, -- cool blue (fits cyberdream)
		},
	},
}
