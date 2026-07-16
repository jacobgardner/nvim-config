local colors = require("dracula").colors()
vim.cmd([[colorscheme dracula]])

local setHighlight = function(name, hi_colors)
	vim.api.nvim_set_hl(0, name, hi_colors)
end

setHighlight("TreesitterContext", { bg = colors.comment })
setHighlight("FidgetTitle", { fg = colors.comment })
setHighlight("FidgetTask", { bg = colors.orange })
setHighlight("LspCodeLens", { fg = colors.comment, italic = true })
setHighlight("LspCodeLensSeparator", { fg = colors.selection })

setHighlight("DiffAdd", { bg = "#2E493F" })
setHighlight("DiffDelete", { bg = "#48303B" })
setHighlight("DiffChange", { bg = "#343746" })
setHighlight("DiffText", { bg = "#5E4E44" })
