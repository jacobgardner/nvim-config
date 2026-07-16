local plugin_autocmds = vim.api.nvim_create_augroup("plugin_config", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = plugin_autocmds,
	callback = function(args)
		local filetype = args.match
		local lang = vim.treesitter.language.get_lang(filetype)
		if lang and vim.treesitter.language.add(lang) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.treesitter.start()
		end
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	group = plugin_autocmds,
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" then
			local result = vim.system({ "make" }, { cwd = ev.data.path }):wait()
			if result.code ~= 0 then
				vim.notify("Failed to build telescope-fzf-native.nvim:\n" .. result.stderr, vim.log.levels.ERROR)
			end
		end
	end,
})

vim.pack.add({
	"https://github.com/kkharji/sqlite.lua",
	"https://github.com/mrjones2014/legendary.nvim",
	"https://github.com/mofiqul/dracula.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/windwp/nvim-ts-autotag",
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/s1n7ax/nvim-window-picker",
	"https://github.com/b0o/incline.nvim",
	"https://github.com/z4p5a9/blamer.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/pmizio/typescript-tools.nvim",
	"https://github.com/MagicDuck/grug-far.nvim",
	"https://github.com/nvimdev/lspsaga.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-nvim-lua",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/ray-x/lsp_signature.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/coffebar/neovim-project",
	"https://github.com/Shatur/neovim-session-manager",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/windwp/nvim-autopairs",
})

require("plugins.neo-tree")
require("plugins.legendary")
require("plugins.null-ls")
require("plugins.treesitter")

require("grug-far").setup({
	windowCreationCommand = "vertical topleft split",
	prefills = {
		flags = "-i",
	},
	openTargetWindow = {
		preferredLocation = "right",
		useScratchBuffer = true,
	},
})

local typescript_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }

local function typescript_root(bufnr)
	local filename = vim.api.nvim_buf_get_name(bufnr)
	return vim.fs.root(filename, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
		or vim.fs.dirname(filename)
end

require("typescript-tools").setup({
	settings = {
		code_lens = "all",
		expose_as_code_action = "all",
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	filetypes = typescript_filetypes,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	root_dir = function(bufnr, on_dir)
		on_dir(typescript_root(bufnr))
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = plugin_autocmds,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "typescript-tools" then
			pcall(vim.api.nvim_del_augroup_by_name, "TypescriptToolsCodeLensGroup")
			vim.lsp.codelens.enable(true, { bufnr = args.buf })
		end
	end,
})

-- FileType may fire before this config is loaded when Neovim starts with a file argument.
vim.schedule(function()
	local config = vim.lsp.config["typescript-tools"]
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) and vim.tbl_contains(typescript_filetypes, vim.bo[bufnr].filetype) then
			local resolved_config = vim.tbl_extend("force", {}, config, { root_dir = typescript_root(bufnr) })
			vim.lsp.start(resolved_config, { bufnr = bufnr })
		end
	end
end)

require("neovim-project").setup({
	projects = {
		"~/projects/*",
		"~/.config/nvim",
	},
})

require("plugins.gitsigns")
require("telescope").load_extension("fzf")
require("plugins.telescope")
require("plugins.mason")
require("plugins.mason-lspconfig")
require("plugins.blamer")
require("plugins.incline")
require("window-picker").setup({
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		bo = {
			filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
			buftype = { "terminal" },
		},
	},
	other_win_hl_color = "#e35e4f",
})

require("plugins.dracula")
require("plugins.lspsaga")
require("plugins.luasnip")
require("plugins.cmp")
require("plugins.lspconfig")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.lsp_signature")
require("fidget").setup()
require("plugins.autopairs")

require("diffview").setup({
	enhanced_diff_hl = true,
})
