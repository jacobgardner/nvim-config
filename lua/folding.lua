vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "1"

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
	group = vim.api.nvim_create_augroup("folding", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt_local.foldlevel = 99
	end,
})
