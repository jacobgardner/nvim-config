local opt = vim.opt

-- Used by util.font-size
vim.g.default_font_size = 12
vim.g.copilot_no_tab_map = true

if vim.fn.has("win32") == 1 then
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

vim.filetype.add({
	extension = {
		wgsl = "wgsl",
		vert = "wgsl",
		frag = "wgsl",
	},
})

-- Neovim running remotely inside SSH/Zellij/WezTerm:
-- copy out via OSC 52; paste in via WezTerm's terminal paste.

vim.opt.clipboard = "" -- do NOT use unnamedplus for this setup

local osc52 = require("vim.ui.clipboard.osc52")

-- Fallback paste provider: do not query the Windows clipboard via OSC52.
-- This keeps "+p from hanging; use Ctrl-Shift-V in WezTerm for Windows paste.
local function paste_from_nvim_register()
	return {
		vim.fn.getreg('"', 1, true),
		vim.fn.getregtype('"'),
	}
end

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = osc52.copy("+"),
		["*"] = osc52.copy("*"),
	},
	paste = {
		["+"] = paste_from_nvim_register,
		["*"] = paste_from_nvim_register,
	},
	cache_enabled = 0,
}

-- Make normal yanks copy to your Windows clipboard.
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("osc52-yank", { clear = true }),
	callback = function()
		if vim.v.event.operator == "y" then
			osc52.copy("+")(vim.v.event.regcontents, vim.v.event.regtype)
		end
	end,
})

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
