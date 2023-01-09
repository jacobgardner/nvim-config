require("settings")

require("util.script-path")

local fs = require("util.font-size")
fs.reset_font_size()

require("plugins")

require("keymaps")

require("autocmds")
require("folding")

vim.opt.cmdheight = 1

