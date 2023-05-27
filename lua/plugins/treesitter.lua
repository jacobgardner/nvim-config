require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
	ensure_installed = { "rust", "typescript", "javascript", "lua", "hcl", "python", "markdown", "markdown_inline" },
	highlight = {
		enable = true,
	},
})


