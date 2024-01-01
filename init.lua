if vim.g.vscode then

else 

    require("settings")

    require("util.script-path")

    local fs = require("util.font-size")
    fs.reset_font_size()

    require("plugins.init")

    require("keymaps")

    require("autocmds")
    require("folding")
    require("utils")

    vim.opt.cmdheight = 1

end