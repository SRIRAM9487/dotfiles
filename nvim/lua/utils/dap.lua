vim.api.nvim_set_hl(0, "DapStoppedHl", {
	fg = "#98BB6C",
	bg = "#2A2A2A",
	bold = true,
})

vim.api.nvim_set_hl(0, "DapStoppedLineHl", {
	bg = "#204028",
	bold = true,
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "DapStoppedHl",
	linehl = "DapStoppedLineHl",
	numhl = "",
})

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpointCondition", {
	text = "",
	texthl = "DiagnosticSignWarn",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapLogPoint", {
	text = "",
	texthl = "DiagnosticSignInfo",
	linehl = "",
	numhl = "",
})
