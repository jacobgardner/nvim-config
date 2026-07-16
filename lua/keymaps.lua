local fs = require("util.font-size")
local script_paths = require("util.script-path")

vim.opt.updatetime = 300
vim.opt.swapfile = false

script_paths.register_script("keymaps")

vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-h>", "<C-w>")

vim.keymap.set("n", "<leader>z+", function()
	fs.increase_font_size(vim.v.count)
end, { desc = "Increase font-size (supports count prefix)" })

vim.keymap.set("n", "<leader>z0", function()
	fs.reset_font_size()
end, { desc = "Reset font-size to default" })

vim.keymap.set("n", "<leader>z-", function()
	fs.decrease_font_size(vim.v.count)
end, { desc = "Decrease font-size (supports count prefix)" })

vim.keymap.set("n", "<leader>zs", function()
	fs.set_font_size(vim.v.count)
end, { desc = "Set font to a specific size" })
