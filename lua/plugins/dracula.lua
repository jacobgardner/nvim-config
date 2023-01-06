local colors = require("dracula").colors()
vim.cmd([[colorscheme dracula]])

local setHighlight = function(name, hi_colors)
	vim.api.nvim_set_hl(0, name, hi_colors)
end

setHighlight("TreesitterContext", { bg = colors.comment })
setHighlight("FidgetTitle", { fg = colors.comment })
setHighlight("FidgetTask", { bg = colors.orange })
setHighlight("debugBreakpoint", { fg = colors.red })
setHighlight("debugPc", { bg = colors.comment })


