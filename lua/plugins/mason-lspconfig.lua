local masonLspConfig = require("mason-lspconfig")

masonLspConfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
	},
})
