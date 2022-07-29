
-- When focusing on a terinal window, start in 
-- insert mode
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "term://*",

	callback = function()
		vim.cmd([[startinsert!]])
	end,
})
