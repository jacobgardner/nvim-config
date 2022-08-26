local opt = vim.opt

-- Used by util.font-size
vim.g.default_font_size = 12
vim.g.default_gui_font = {"FiraCode Nerd Font", "FiraCode NF", "FuraCode NF"}

vim.g.mapleader = " "
vim.g.completeopt = "menu,menuone,noselect"
opt.mouse = "a"

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.number = true
opt.numberwidth = 2
opt.ruler = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false

opt.laststatus = 3 -- global statusline

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- How many lines should aways be visible above/below the current cursor
opt.scrolloff = 4
-- Same, but left/right
opt.sidescrolloff = 10

vim.g.neo_tree_remove_legacy_commands = 1

opt.ignorecase = true
opt.smartcase = true

vim.g.symbols_outline = {
  
}

vim.cmd[[au BufRead,BufNewFile *.wgsl set filetype=wgsl]]
vim.cmd[[au BufRead,BufNewFile *.vert set filetype=wgsl]]
vim.cmd[[au BufRead,BufNewFile *.frag set filetype=wgsl]]

