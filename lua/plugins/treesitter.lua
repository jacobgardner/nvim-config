require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
	ensure_installed = { "rust", "typescript", "javascript", "lua", "hcl", "python" },
	highlight = {
		enable = true,
	},
})
