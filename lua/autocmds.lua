-- When focusing on a terinal window, start in
-- insert mode
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "term://*",

	callback = function()
		vim.cmd([[startinsert!]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*.jade",
	callback = function()
		vim.bo.filetype = "pug"
	end,
})


