local opt = vim.opt

-- Used by util.font-size
vim.g.default_font_size = 12
vim.g.copilot_no_tab_map = true

if vim.fn.has("win32") then
	vim.g.default_gui_font = "FiraCode_Nerd_Font" -- "FiraCode_NFM"
else
	-- vim.g.default_gui_font = {"FiraCode_Nerd_Font", "FiraCode_NF", "FuraCode_NF"}
	vim.g.default_gui_font = "FiraCode_Nerd_Font"
end

vim.g.mapleader = " "
vim.g.completeopt = "menu,menuone,noselect"
vim.g.autoformat = true
opt.mouse = "a"
opt.splitkeep = "screen"

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

vim.g.symbols_outline = {}

vim.cmd([[au BufRead,BufNewFile *.tf set filetype=teraterm]])
vim.cmd([[au BufRead,BufNewFile *.wgsl set filetype=wgsl]])
vim.cmd([[au BufRead,BufNewFile *.vert set filetype=wgsl]])
vim.cmd([[au BufRead,BufNewFile *.frag set filetype=wgsl]])

-- vim.g.rustaceanvim = {
-- 	-- LSP configuration
-- 	server = {
-- 		settings = {
-- 			-- rust-analyzer language server configuration
-- 			["rust-analyzer"] = {
--           cargo = { allFeatures = true },
--           checkOnSave = true,
--           check = {
--             enable = true,
--             command = 'clippy',
--             features = 'all',
--           },
--           procMacro = {
--             enable = true,
--           },
--       },
-- 		},
-- 	},
-- }
