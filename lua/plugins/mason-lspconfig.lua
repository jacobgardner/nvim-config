local masonLspConfig = require("mason-lspconfig")

masonLspConfig.setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
	},
})
