-- needs to install tree-sitter-cli
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ensure_installed = {
			"c",
			"java",
      "html",
      "css",
      "javascript",
		}

		require("nvim-treesitter").install(ensure_installed)
	end,
}
