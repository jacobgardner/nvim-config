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
		"nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    config = function()
      require('telescope').load_extension('fzf')
    end
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
				version = "v1.*",
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

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          -- ["core.concealer"] = {}, -- Adds pretty icons to your documents
          -- ["core.ui.calendar"] = {}, -- Adds pretty icons to your documents
          -- ["core.summary"] = {}, -- Adds pretty icons to your documents
          -- ["core.presenter"] = {}, -- Adds pretty icons to your documents
          -- ["core.completion"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
})
