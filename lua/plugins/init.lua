local bootstrap = require("plugins.bootstrap")

bootstrap(function(use)
	-- use({
	-- 	"Shatur/neovim-session-manager",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("session_manager").setup({})
	-- 	end,
	-- })

	use({
		"Mofiqul/dracula.nvim",
		config = function()
			vim.cmd([[colorscheme dracula]])
			local colors = require("dracula").colors()
			local set_context_cmd = "hi TreesitterContext guibg=" .. colors.comment
			local set_fidget_title_cmd = "hi FidgetTitle guifg=" .. colors.comment
			local set_fidget_task_cmd = "hi FidgetTask guibg=" .. colors.orange

			vim.cmd(set_context_cmd)
			vim.cmd(set_fidget_title_cmd)
			vim.cmd(set_fidget_task_cmd)
		end,
	})

	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason")
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip")
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		after = { "mason.nvim" },
		requires = { "williamboman/mason.nvim" },
		config = function()
			vim.cmd([[packadd mason.nvim]])

			require("plugins.mason")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		-- after = { "lsp_signature.nvim" },
		config = function()
			require("plugins.lspconfig")
		end,
	})

	use({
		"folke/which-key.nvim",
		keys = { "<leader>" },
		config = function()
			require("plugins.which-key")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = { "Telescope" },
		config = function()
			vim.cmd([[packadd plenary.nvim]])

			require("plugins.telescope")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { { "windwp/nvim-ts-autotag" } },
		config = function()
			require("plugins.treesitter")
		end,
	})

	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	-- Shows parent scopes when deep
	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = "nvim-treesitter",
		config = function()
			vim.cmd([[packadd nvim-treesitter-context]])

			require("treesitter-context").setup({
				enable = true,
			})
		end,
	})

	-- LSP Integration for non-lsp tools (linters, formatters, etc.)
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		after = "nvim-lspconfig",
		config = function()
			vim.cmd([[packadd plenary.nvim]])

			require("plugins.null-ls")
		end,
	})

	-- Problems panel
	use({
		"folke/trouble.nvim",
		after = "nvim-lspconfig",
		requires = "kyazdani42/nvim-web-devicons",
		opt = true,
		cmd = { "Trouble", "TroubleToggle" },
		config = function()
			vim.cmd([[packadd nvim-web-devicons]])

			require("trouble").setup({})
		end,
	})

	-- Should be able to be lazy loaded, but broke last time I tried
	use({
		"nvim-neo-tree/neo-tree.nvim",
		after = { "nvim-lspconfig" },
		branch = "v2.x",
		-- cmd = { "Neotree" },
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
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
			vim.cmd([[packadd plenary.nvim]])
			vim.cmd([[packadd nvim-web-devicons]])
			vim.cmd([[packadd nui.nvim]])
			vim.cmd([[packadd nvim-window-picker]])
			vim.cmd([[packadd nvim-lspconfig]])

			require("plugins.neo-tree")
		end,
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		after = { "nvim-autopairs", "nvim-lspconfig", "LuaSnip" },
		requires = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			vim.cmd([[packadd cmp-nvim-lsp]])
			vim.cmd([[packadd cmp-nvim-lua]])
			vim.cmd([[packadd cmp-buffer]])
			vim.cmd([[packadd cmp-path]])
			vim.cmd([[packadd cmp-cmdline]])
			vim.cmd([[packadd nvim-cmp]])
			vim.cmd([[packadd LuaSnip]])

			require("plugins.cmp")
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		after = { "nvim-lspconfig" },
		config = function()
			require("plugins.lsp_signature")
		end,
	})

	-- Can probably be lazy loaded
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	})

	-- Automatically add things like closing quotes/braces, etc.
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	})

	-- use({
	-- 	"nanozuki/tabby.nvim",
	--    after = {"lualine.nvim"},
	-- 	config = function()
	-- 		require("plugins.tabby")
	-- 	end,
	-- })

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		after = { "dracula.nvim" },
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			vim.cmd([[packadd nvim-web-devicons]])

			require("plugins.lualine")
		end,
	})

	-- Additional rust functionality via rust-analyzer
	use({
		"simrat39/rust-tools.nvim",
		requires = "neovim/nvim-lspconfig",
		ft = { "rust", "toml" },
		config = function()
			vim.cmd([[packadd nvim-lspconfig]])

			require("plugins.rust-tools")
		end,
	})

	-- LSP progress notification in bottom right
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	-- Find & Replace plugin
	-- NOTE: There seems to be a bug with this one where I can't lazy load using cmd 'Spectre'
	use({
		"windwp/nvim-spectre",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			vim.cmd([[packadd plenary.nvim]])

			require("plugins.spectre")
		end,
	})

	-- Visual scrollbar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({})
		end,
	})

	-- Integrated Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		keys = { "<C-\\>" },
		config = function()
			require("plugins.toggleterm")
		end,
	})

	-- -- Project management in vim
	-- use({
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("plugins.project")
	-- 	end,
	-- })

	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		cmd = { "Cheatsheet", "CheatsheetEdit" },
		config = function()
			vim.cmd([[packadd telescope.nvim]])
			vim.cmd([[packadd popup.nvim]])
			vim.cmd([[packadd plenary.nvim]])

			require("plugins.cheatsheet")
		end,
	})

	use({
		"styled-components/vim-styled-components",
	})

	use({
		"glepnir/lspsaga.nvim",
		after = { "nvim-lspconfig" },
		branch = "main",
		cmd = { "Lspsaga", "LSOutlineToggle", "LspsagaFloaterm" },
		config = function()
			require("plugins.lspsaga")
		end,
	})

	use({
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	})
end)
