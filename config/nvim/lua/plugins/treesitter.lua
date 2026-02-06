return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "java", "javadoc", "xml", "c", "javascript", "html" },
			auto_install = true,
			highlight = { enable = true },
		})
	end,
}
