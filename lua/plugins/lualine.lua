local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "dracula-nvim",
		globalstatus = false,
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
				shorting_target = 40,
			},
		},
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
	extensions = { "neo-tree" },
})
