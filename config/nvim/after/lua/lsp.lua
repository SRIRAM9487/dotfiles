-- FIRES AN LSP EVERY TIME IT ATTACHES TO AN BUFFEr
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client == nil then
			return
		end
	end,
})

-- Custom config for lua_ls
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				disable = {
					"undefined-global",
					"undefined-field",
				},
			},
		},
	},
})

-- Run jdtls only on .java
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function(args)
		require("jdtls.jdtls_setup").setup()
	end,
})

-- Run psql only on .sql
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function(args)
		require("postgres_lsp").setup()
	end,
})

require("lspconfig").lemminx.setup({
	settings = {
		xml = {
			format = { enabled = true },
			validate = true,
			schemas = {
				{
					fileMatch = { "pom.xml" },
					uri = "https://maven.apache.org/xsd/maven-4.0.0.xsd",
				},
			},
		},
	},
})
