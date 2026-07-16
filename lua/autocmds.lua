local autocmds = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Enter insert mode when focusing a terminal window.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = autocmds,
	pattern = "term://*",
	callback = function()
		vim.cmd([[startinsert!]])
	end,
})

vim.filetype.add({
	extension = {
		jade = "pug",
	},
})
