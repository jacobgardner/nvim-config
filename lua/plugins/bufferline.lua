local bufferline = require("bufferline")

bufferline.setup({
	options = {
    mode = 'tabs',
		diagnostics = "nvim_lsp",
		separator_style = "thick",
	},
})
