local masonLspConfig = require("mason-lspconfig")

masonLspConfig.setup({
	automatic_enable = false,
	ensure_installed = {
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"spectral",
		"wgsl_analyzer",
	},
})
