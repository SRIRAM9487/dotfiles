-- FIRES AN LSP EVERY TIME IT ATTACHES TO AN BUFFEr
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client == nil then
			return
		end
	end,
})

-- Run jdtls only on .java
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function(_)
		require("jdtls.jdtls_setup").setup()
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
