local bootstrap = require("plugins.bootstrap")

bootstrap({

	-- Color Scheme
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.dracula")
		end,
	},

	-- Floating Statusline
	{
		"b0o/incline.nvim",
		config = function()
			require("plugins.incline")
		end,
	},

	-- Inline Git Blame
	{
		"APZelos/blamer.nvim",
		config = function()
			require("plugins.blamer")
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason")
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.mason-lspconfig")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		-- after = { "lsp_signature.nvim" },
		config = function()
			require("plugins.lspconfig")
		end,
	},

	-- Leader Cheatsheet
	{
		"folke/which-key.nvim",
		keys = { "<leader>" },
		config = function()
			require("plugins.which-key")
		end,
	},

	-- Colorize ANSI escape sequences from pasting from console
	{
		"m00qek/baleia.nvim",
		version = "v1.3.0",
		config = function()
			require("baleia").setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope" },
		config = function()
			-- vim.cmd([[packadd plenary.nvim]])

			require("plugins.telescope")
		end,
	},

	-- Github CoPilot
	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		event = "InsertEnter",
		config = function()
			require("plugins.copilot")
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- Not needed?  opt.splitkeep = 'screen'
	-- {
	-- 		"luukvbaal/stabilize.nvim",
	-- 		config = function()
	-- 			require("stabilize").setup()
	-- 		end,
	-- 	}

	-- Shows parent scopes when deep
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
			})
		end,
	},

	-- LSP Integration for non-lsp tools (linters, formatters, etc.)
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.null-ls")
		end,
	},

	-- Problems panel
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		lazy = true,
		cmd = { "Trouble", "TroubleToggle" },
		config = function()
			require("trouble").setup({})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v3.x",
		lazy = false,
		priority = 900,
		-- cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
		config = function()
			require("plugins.neo-tree")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("plugins.lsp_signature")
		end,
	},

	-- Can probably be lazy loaded
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},

	-- Automatically add things like closing quotes/braces, etc.
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.lualine")
		end,
	},

	-- Typescript Stuff

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("typescript-tools").setup({
				settings = {
					tsserver_plugins = {
						"@styled/typescript-styled-plugin",
						-- { name = "@styled/typescript-styled-plugin", tags = { "styled", "css" } },
					},
				},
			})
		end,
	},

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},

	-- Additional rust functionality via rust-analyzer
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		ft = { "rust", "toml" },
		config = function()
			require("plugins.rust-tools")
		end,
	},

	-- LSP progress notification in bottom right
	{
		"j-hui/fidget.nvim",
		version = "legacy",
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},

	-- Find & Replace plugin
	-- NOTE: There seems to be a bug with this one where I can't lazy load using cmd 'Spectre'
	{
		"windwp/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.spectre")
		end,
	},

	-- Visual scrollbar
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({})
		end,
	},

	-- Integrated Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "v2.*",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		keys = { "<C-\\>" },
		config = function()
			require("plugins.toggleterm")
		end,
	},

	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		cmd = { "Cheatsheet", "CheatsheetEdit" },
		config = function()
			require("plugins.cheatsheet")
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		cmd = { "Lspsaga", "LSOutlineToggle", "LspsagaFloaterm" },
		config = function()
			require("plugins.lspsaga")
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.nvim-dap")
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugins.nvim-dap-ui")
		end,
	},

	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugins.nvim-dap-vscode-js")
		end,
	},
})

-- bootstrap(function(use)
-- 	-- use({
-- 	-- 	"Shatur/neovim-session-manager",
-- 	-- 	requires = { "nvim-lua/plenary.nvim" },
-- 	-- 	config = function()
-- 	-- 		require("session_manager").setup({})
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"Mofiqul/dracula.nvim",
-- 	-- 	config = function()
-- 	-- 		require("plugins.dracula")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"b0o/incline.nvim",
-- 	-- 	config = function()
-- 	-- 		require("plugins.incline")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"APZelos/blamer.nvim",
-- 	-- 	config = function()
-- 	-- 		require("plugins.blamer")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"williamboman/mason.nvim",
-- 	-- 	config = function()
-- 	-- 		require("plugins.mason")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"L3MON4D3/LuaSnip",
-- 	-- 	config = function()
-- 	-- 		require("plugins.luasnip")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"williamboman/mason-lspconfig.nvim",
-- 	-- 	after = { "mason.nvim" },
-- 	-- 	requires = { "williamboman/mason.nvim" },
-- 	-- 	config = function()
-- 	-- 		vim.cmd([[packadd mason.nvim]])
-- 	--
-- 	-- 		require("plugins.mason")
-- 	-- 	end,
-- 	-- })
--
-- 	-- use({
-- 	-- 	"neovim/nvim-lspconfig",
-- 	-- 	-- after = { "lsp_signature.nvim" },
-- 	-- 	config = function()
-- 	-- 		require("plugins.lspconfig")
-- 	-- 	end,
-- 	-- })
--
-- 	use({
-- 		"folke/which-key.nvim",
-- 		keys = { "<leader>" },
-- 		config = function()
-- 			require("plugins.which-key")
-- 		end,
-- 	})
--
-- 	use({
-- 		"m00qek/baleia.nvim",
-- 		tag = "v1.3.0",
-- 		config = function()
-- 			require("baleia").setup()
-- 		end,
-- 	})
--
-- 	use({
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.0",
-- 		requires = { { "nvim-lua/plenary.nvim" } },
-- 		cmd = { "Telescope" },
-- 		config = function()
-- 			vim.cmd([[packadd plenary.nvim]])
--
-- 			require("plugins.telescope")
-- 		end,
-- 	})
--
-- 	use({
-- 		"nvim-treesitter/nvim-treesitter",
-- 		requires = { { "windwp/nvim-ts-autotag" } },
-- 		run = function()
-- 			require("nvim-treesitter.install").update({ with_sync = true })
-- 		end,
-- 		config = function()
-- 			require("plugins.treesitter")
-- 		end,
-- 	})
--
-- 	use({
-- 		"luukvbaal/stabilize.nvim",
-- 		config = function()
-- 			require("stabilize").setup()
-- 		end,
-- 	})
--
-- 	-- Shows parent scopes when deep
-- 	use({
-- 		"nvim-treesitter/nvim-treesitter-context",
-- 		requires = "nvim-treesitter",
-- 		config = function()
-- 			vim.cmd([[packadd nvim-treesitter-context]])
--
-- 			require("treesitter-context").setup({
-- 				enable = true,
-- 			})
-- 		end,
-- 	})
--
-- 	-- LSP Integration for non-lsp tools (linters, formatters, etc.)
-- 	use({
-- 		"jose-elias-alvarez/null-ls.nvim",
-- 		requires = { "nvim-lua/plenary.nvim" },
-- 		after = "nvim-lspconfig",
-- 		config = function()
-- 			vim.cmd([[packadd plenary.nvim]])
--
-- 			require("plugins.null-ls")
-- 		end,
-- 	})
--
-- 	-- Problems panel
-- 	use({
-- 		"folke/trouble.nvim",
-- 		after = "nvim-lspconfig",
-- 		requires = "kyazdani42/nvim-web-devicons",
-- 		opt = true,
-- 		cmd = { "Trouble", "TroubleToggle" },
-- 		config = function()
-- 			vim.cmd([[packadd nvim-web-devicons]])
--
-- 			require("trouble").setup({})
-- 		end,
-- 	})
--
-- 	-- Should be able to be lazy loaded, but broke last time I tried
-- 	use({
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		after = { "nvim-lspconfig" },
-- 		branch = "v2.x",
-- 		-- cmd = { "Neotree" },
-- 		requires = {
-- 			"nvim-lua/plenary.nvim",
-- 			"kyazdani42/nvim-web-devicons",
-- 			"MunifTanjim/nui.nvim",
-- 			{
-- 				-- only needed if you want to use the commands with "_with_window_picker" suffix
-- 				"s1n7ax/nvim-window-picker",
-- 				tag = "v1.*",
-- 				config = function()
-- 					require("window-picker").setup({
-- 						autoselect_one = true,
-- 						include_current = false,
-- 						filter_rules = {
-- 							-- filter using buffer options
-- 							bo = {
-- 								-- if the file type is one of following, the window will be ignored
-- 								filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
--
-- 								-- if the buffer type is one of following, the window will be ignored
-- 								buftype = { "terminal" },
-- 							},
-- 						},
-- 						other_win_hl_color = "#e35e4f",
-- 					})
-- 				end,
-- 			},
-- 		},
-- 		config = function()
-- 			-- vim.cmd([[packadd plenary.nvim]])
-- 			-- vim.cmd([[packadd nvim-web-devicons]])
-- 			-- vim.cmd([[packadd nui.nvim]])
-- 			-- vim.cmd([[packadd nvim-window-picker]])
-- 			-- vim.cmd([[packadd nvim-lspconfig]])
-- 			--
-- 			require("plugins.neo-tree")
-- 		end,
-- 	})
--
-- 	-- use({
-- 	-- 	"nvim-tree/nvim-tree.lua",
-- 	-- 	tag = "nightly",
-- 	-- 	requires = {
-- 	-- 		"kyazdani42/nvim-web-devicons",
-- 	-- 		-- "nvim-tree/nvim-web-devicons",
-- 	-- 	},
-- 	-- 	config = function()
-- 	-- 		vim.cmd([[packadd nvim-web-devicons]])
-- 	--
-- 	-- 		require("plugins.nvim-tree")
-- 	-- 	end,
-- 	-- })
--
-- 	-- Completion
-- 	use({
-- 		"hrsh7th/nvim-cmp",
-- 		after = { "nvim-autopairs", "nvim-lspconfig", "LuaSnip" },
-- 		requires = {
-- 			"hrsh7th/cmp-nvim-lsp-signature-help",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-nvim-lua",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"hrsh7th/cmp-cmdline",
-- 			"hrsh7th/nvim-cmp",
-- 		},
-- 		config = function()
-- 			vim.cmd([[packadd cmp-nvim-lsp]])
-- 			vim.cmd([[packadd cmp-nvim-lua]])
-- 			vim.cmd([[packadd cmp-buffer]])
-- 			vim.cmd([[packadd cmp-path]])
-- 			vim.cmd([[packadd cmp-cmdline]])
-- 			vim.cmd([[packadd nvim-cmp]])
-- 			vim.cmd([[packadd LuaSnip]])
--
-- 			require("plugins.cmp")
-- 		end,
-- 	})
--
-- 	use({
-- 		"ray-x/lsp_signature.nvim",
-- 		after = { "nvim-lspconfig" },
-- 		config = function()
-- 			require("plugins.lsp_signature")
-- 		end,
-- 	})
--
-- 	-- Can probably be lazy loaded
-- 	use({
-- 		"numToStr/Comment.nvim",
-- 		config = function()
-- 			require("plugins.comment")
-- 		end,
-- 	})
--
-- 	-- Automatically add things like closing quotes/braces, etc.
-- 	use({
-- 		"windwp/nvim-autopairs",
-- 		config = function()
-- 			require("plugins.autopairs")
-- 		end,
-- 	})
--
-- 	use({
-- 		"lewis6991/gitsigns.nvim",
-- 		config = function()
-- 			require("plugins.gitsigns")
-- 		end,
-- 	})
--
-- 	-- use({
-- 	-- 	"nanozuki/tabby.nvim",
-- 	--    after = {"lualine.nvim"},
-- 	-- 	config = function()
-- 	-- 		require("plugins.tabby")
-- 	-- 	end,
-- 	-- })
--
-- 	use({
-- 		"akinsho/bufferline.nvim",
-- 		config = function()
-- 			require("plugins.bufferline")
-- 		end,
-- 	})
--
-- 	use({
-- 		"nvim-lualine/lualine.nvim",
-- 		after = { "dracula.nvim" },
-- 		requires = { "kyazdani42/nvim-web-devicons" },
-- 		config = function()
-- 			vim.cmd([[packadd nvim-web-devicons]])
--
-- 			require("plugins.lualine")
-- 		end,
-- 	})
--
-- 	use({
-- 		"saecki/crates.nvim",
-- 		event = { "BufRead Cargo.toml" },
-- 		requires = { { "nvim-lua/plenary.nvim" } },
-- 		config = function()
-- 			require("crates").setup()
-- 		end,
-- 	})
--
-- 	-- Additional rust functionality via rust-analyzer
-- 	use({
-- 		"simrat39/rust-tools.nvim",
-- 		requires = "neovim/nvim-lspconfig",
-- 		ft = { "rust", "toml" },
-- 		config = function()
-- 			vim.cmd([[packadd nvim-lspconfig]])
--
-- 			require("plugins.rust-tools")
-- 		end,
-- 	})
--
-- 	-- LSP progress notification in bottom right
-- 	use({
-- 		"j-hui/fidget.nvim",
-- 		config = function()
-- 			require("fidget").setup()
-- 		end,
-- 	})
--
-- 	-- Find & Replace plugin
-- 	-- NOTE: There seems to be a bug with this one where I can't lazy load using cmd 'Spectre'
-- 	use({
-- 		"windwp/nvim-spectre",
-- 		requires = "nvim-lua/plenary.nvim",
-- 		config = function()
-- 			vim.cmd([[packadd plenary.nvim]])
--
-- 			require("plugins.spectre")
-- 		end,
-- 	})
--
-- 	-- Visual scrollbar
-- 	use({
-- 		"petertriho/nvim-scrollbar",
-- 		config = function()
-- 			require("scrollbar").setup({})
-- 		end,
-- 	})
--
-- 	-- Integrated Terminal
-- 	use({
-- 		"akinsho/toggleterm.nvim",
-- 		tag = "v2.*",
-- 		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
-- 		keys = { "<C-\\>" },
-- 		config = function()
-- 			require("plugins.toggleterm")
-- 		end,
-- 	})
--
-- 	-- -- Project management in vim
-- 	-- use({
-- 	-- 	"ahmedkhalf/project.nvim",
-- 	-- 	config = function()
-- 	-- 		require("plugins.project")
-- 	-- 	end,
-- 	-- })
--
-- 	use({
-- 		"sudormrfbin/cheatsheet.nvim",
-- 		requires = {
-- 			"nvim-telescope/telescope.nvim",
-- 			"nvim-lua/popup.nvim",
-- 			"nvim-lua/plenary.nvim",
-- 		},
-- 		cmd = { "Cheatsheet", "CheatsheetEdit" },
-- 		config = function()
-- 			vim.cmd([[packadd telescope.nvim]])
-- 			vim.cmd([[packadd popup.nvim]])
-- 			vim.cmd([[packadd plenary.nvim]])
--
-- 			require("plugins.cheatsheet")
-- 		end,
-- 	})
--
-- 	-- use({
-- 	-- 	"styled-components/vim-styled-components",
-- 	-- })
--
-- 	use({
-- 		"glepnir/lspsaga.nvim",
-- 		after = { "nvim-lspconfig" },
-- 		branch = "main",
-- 		cmd = { "Lspsaga", "LSOutlineToggle", "LspsagaFloaterm" },
-- 		config = function()
-- 			require("plugins.lspsaga")
-- 		end,
-- 	})
--
-- 	use({
-- 		"simrat39/symbols-outline.nvim",
-- 		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
-- 	})
--
-- 	use({
-- 		"mfussenegger/nvim-dap",
-- 		config = function()
-- 			require("plugins.nvim-dap")
-- 		end,
-- 	})
--
-- 	use({
-- 		"rcarriga/nvim-dap-ui",
-- 		requires = { "mfussenegger/nvim-dap" },
-- 		config = function()
-- 			require("plugins.nvim-dap-ui")
-- 		end,
-- 	})
--
-- 	use({
-- 		"microsoft/vscode-js-debug",
-- 		opt = true,
-- 		run = "npm install --legacy-peer-deps && npm run compile",
-- 	})
--
-- 	use({
-- 		"mxsdev/nvim-dap-vscode-js",
-- 		requires = { "mfussenegger/nvim-dap" },
-- 		config = function()
-- 			require("plugins.nvim-dap-vscode-js")
-- 		end,
-- 	})
-- end)
