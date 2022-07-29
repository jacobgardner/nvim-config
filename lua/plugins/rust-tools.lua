local lsp_keybinds = require("util.lsp_keybinds")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("rust-tools").setup({
	server = {
		on_attach = lsp_keybinds.on_attach,
		capabilities = capabilities,
	},
})
