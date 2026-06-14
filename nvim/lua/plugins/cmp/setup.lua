local cmp = require("cmp")

-- require("plugins.cmp.snippets")
-- Set the completion menu selection to a clear, high-contrast gray
vim.api.nvim_set_hl(0, "CmpSel", { bg = "#3a3a3a", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3a3a3a", fg = "#ffffff", bold = true })

-- Optional: Ensure the rest of the menu follows your monochrome aesthetic
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1a1a1a", fg = "#cccccc" }) -- Menu background
vim.api.nvim_set_hl(0, "CmpMatch", { fg = "#ffffff", bold = true }) -- Matched characters
cmp.setup({
	------------------------------------------------------------------
	-- enable / disable completion
	------------------------------------------------------------------
	enabled = require("plugins.cmp.enabled"),

	------------------------------------------------------------------
	-- snippet expansion
	------------------------------------------------------------------
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	------------------------------------------------------------------
	-- completion behavior
	------------------------------------------------------------------
	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	------------------------------------------------------------------
	-- mappings
	------------------------------------------------------------------
	mapping = require("plugins.cmp.mappings"),

	------------------------------------------------------------------
	-- sources
	------------------------------------------------------------------
	sources = require("plugins.cmp.sources"),

	------------------------------------------------------------------
	-- formatting
	------------------------------------------------------------------
	formatting = require("plugins.cmp.formatting"),

	------------------------------------------------------------------
	-- windows
	------------------------------------------------------------------
	window = require("plugins.cmp.window"),

	------------------------------------------------------------------
	-- experimental
	------------------------------------------------------------------
	experimental = {
		ghost_text = false,
	},
})

----------------------------------------------------------------------
-- cmdline completion
----------------------------------------------------------------------
require("plugins.cmp.cmdline")
