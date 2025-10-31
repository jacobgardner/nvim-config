local masonLspConfig = require("mason-lspconfig")

masonLspConfig.setup({
  automatic_enable = false,
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
	},
})
