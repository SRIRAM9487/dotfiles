return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {

		-- Snippet engine
		"L3MON4D3/LuaSnip",

		-- CMP sources
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		-- Snippet collection
		"rafamadriz/friendly-snippets",

		-- Completion item icons
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load VS Code–style snippets lazily
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			------------------------------------------------------------------
			-- Enable / disable completion contextually
			------------------------------------------------------------------
			enabled = function()
				local context = require("cmp.config.context")

				-- Always enable in command mode
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				end

				-- Disable in comments
				return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
			end,

			------------------------------------------------------------------
			-- Snippet expansion
			------------------------------------------------------------------
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			------------------------------------------------------------------
			-- Completion behavior
			------------------------------------------------------------------
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			------------------------------------------------------------------
			-- Key mappings
			------------------------------------------------------------------
			mapping = cmp.mapping.preset.insert({

				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion

				["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions

				-- Safer confirm (no accidental commits)
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						})
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			------------------------------------------------------------------
			-- Completion sources (with priorities)
			------------------------------------------------------------------

			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10000 }, -- lsp
				{
					name = "buffer",
					priority = 500,
					option = {
						get_bufnrs = function()
							return { vim.api.nvim_get_current_buf() }
						end,
					},
				}, -- text within current buffer
				{ name = "path", priority = 8000 }, -- file system paths
				{ name = "luasnip", priority = 7000 }, -- snippets
			}),

			------------------------------------------------------------------
			-- Formatting (icons, labels, truncation)
			------------------------------------------------------------------
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "…",
				}),
			},

			------------------------------------------------------------------
			-- Window appearance
			------------------------------------------------------------------
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			------------------------------------------------------------------
			-- Experimental features
			------------------------------------------------------------------
			experimental = {
				ghost_text = true,
			},
		})

		----------------------------------------------------------------------
		-- Cmdline completion
		----------------------------------------------------------------------

		-- ':' command completion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})

		-- '/' and '?' search completion
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}
