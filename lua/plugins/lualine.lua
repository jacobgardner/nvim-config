local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "dracula-nvim",
		globalstatus = true,
	},
	extensions = { "neo-tree" },
})
