local bootstrap = require("plugins.bootstrap")

bootstrap({

  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end
  },
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
      { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended keymaps
      vim.keymap.set('n', '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
      vim.keymap.set('n', '<leader>oA', function() require('opencode').ask() end, { desc = 'Ask opencode' })
      vim.keymap.set('n', '<leader>oa', function() require('opencode').ask('@cursor: ') end,
        { desc = 'Ask opencode about this' })
      vim.keymap.set('v', '<leader>oa', function() require('opencode').ask('@selection: ') end,
        { desc = 'Ask opencode about selection' })
      vim.keymap.set('n', '<leader>on', function() require('opencode').command('session_new') end,
        { desc = 'New opencode session' })
      vim.keymap.set('n', '<leader>oy', function() require('opencode').command('messages_copy') end,
        { desc = 'Copy last opencode response' })
      vim.keymap.set('n', '<S-C-u>', function() require('opencode').command('messages_half_page_up') end,
        { desc = 'Messages half page up' })
      vim.keymap.set('n', '<S-C-d>', function() require('opencode').command('messages_half_page_down') end,
        { desc = 'Messages half page down' })
      vim.keymap.set({ 'n', 'v' }, '<leader>os', function() require('opencode').select() end,
        { desc = 'Select opencode prompt' })

      -- Example: keymap for custom prompt
      vim.keymap.set('n', '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end,
        { desc = 'Explain this code' })
    end,
  },

  -- Neorg dependency
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

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

  -- Jenkinsfile

  { "ckipp01/nvim-jenkinsfile-linter", dependencies = { "nvim-lua/plenary.nvim" } },

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

  -- -- Leader Cheatsheet
  -- {
  -- 	"folke/which-key.nvim",
  -- 	keys = { "<leader>" },
  -- 	config = function()
  -- 		require("plugins.which-key")
  -- 	end,
  -- },

  -- Colorize ANSI escape sequences from pasting from console
  {
    "m00qek/baleia.nvim",
    version = "v1.4.0",
    config = function()
      require("baleia").setup()
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    config = function()
      -- vim.cmd([[packadd plenary.nvim]])

      require("plugins.telescope")
    end,
  },

  {
    "github/copilot.vim",
  },

  -- Github CoPilot
  -- {
  -- 	"zbirenbaum/copilot.lua",
  -- 	cmd = { "Copilot" },
  -- 	event = "InsertEnter",
  -- 	config = function()
  -- 		require("plugins.copilot")
  -- 	end,
  -- },
  --
  -- {
  -- 	"zbirenbaum/copilot-cmp",
  -- 	config = function()
  -- 		require("copilot_cmp").setup()
  -- 	end,
  -- },

  -- {
  -- 	"yetone/avante.nvim",
  -- 	event = "VeryLazy",
  -- 	lazy = false,
  -- 	version = false, -- set this if you want to always pull the latest change
  -- 	opts = {
  -- 		provider = "copilot",
  -- 		auto_suggestions_provider = "copilot",
  -- 		copilot = {
  -- 			model = "claude-3.5-sonnet",
  -- 			max_tokens = 64000,
  -- 		},
  -- 		-- provider = "deepseek",
  -- 		-- deepseek = {
  -- 		--   endpoint = "https://api.deepseek.com",
  -- 		--   model = "deepseek-coder",
  -- 		--   temperature = 0,
  -- 		--   max_tokens = 4096,
  -- 		-- },
  -- 	},
  -- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- 	build = "make",
  -- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  -- 	dependencies = {
  -- 		"stevearc/dressing.nvim",
  -- 		"nvim-lua/plenary.nvim",
  -- 		"MunifTanjim/nui.nvim",
  -- 		--- The below dependencies are optional,
  -- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  -- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  -- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
  -- 		{
  -- 			-- support for image pasting
  -- 			"HakonHarnes/img-clip.nvim",
  -- 			event = "VeryLazy",
  -- 			opts = {
  -- 				-- recommended settings
  -- 				default = {
  -- 					embed_image_as_base64 = false,
  -- 					prompt_for_file_name = false,
  -- 					drag_and_drop = {
  -- 						insert_mode = true,
  -- 					},
  -- 					-- required for Windows users
  -- 					use_absolute_path = true,
  -- 				},
  -- 			},
  -- 		},
  -- 		{
  -- 			-- Make sure to set this up properly if you have lazy=true
  -- 			"MeanderingProgrammer/render-markdown.nvim",
  -- 			opts = {
  -- 				file_types = { "markdown", "Avante" },
  -- 			},
  -- 			ft = { "markdown", "Avante" },
  -- 		},
  -- 	},
  -- },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim",                     branch = "master" }, -- for curl, log and async functions
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        display = {
          action_palette = {
            provider = "telescope",
          },
        },
        -- adapters = {
        --   deepseek = function()
        --     return require("codecompanion.adapters.http").extend("openai_compatible", {
        --       env = {
        --         url = "https://api.deepseek.com",
        --         api_key = "sk-0519684efd3345cbae0e6728294b7abf",
        --         chat_url = "/chat/completions",
        --       },
        --     })
        --   end,
        -- },
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },
      })
    end,
  },

  -- Better Code Folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = false,
  },

  -- Various Improvements
  { "echasnovski/mini.nvim",           version = false },

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
    "nvimtools/none-ls.nvim",
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
    -- event = "VimEnter",
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
        code_lens = "all",
        expose_as_code_action = "all",
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        root_dir = function(fname)
          local util = require("lspconfig.util")

          local root_dir = util.root_pattern(".git")(fname)
              or util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)

          return root_dir
        end,
        tsserver_plugins = {
          "@styled/typescript-styled-plugin",
        },
      })
    end,
    -- config = function()
    -- 	require("typescript-tools").setup({
    -- 		settings = {
    -- 			-- tsserver_plugins = {
    -- 			-- 	"@styled/typescript-styled-plugin",
    -- 			-- 	-- { name = "@styled/typescript-styled-plugin", tags = { "styled", "css" } },
    -- 			-- },
    -- 		},
    -- 	})
    -- end,
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
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,
    -- ft = { "rust", "toml" },
  },
  -- {
  -- 	"simrat39/rust-tools.nvim",
  -- 	dependencies = { "neovim/nvim-lspconfig" },
  -- 	ft = { "rust", "toml" },
  -- 	config = function()
  -- 		require("plugins.rust-tools")
  -- 	end,
  -- },

  -- LSP progress notification in bottom right
  {
    "j-hui/fidget.nvim",
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
    version = "*",
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
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("plugins.nvim-dap-ui")
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",      -- required
      "sindrets/diffview.nvim",     -- optional - Diff integration
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },

  -- {
  -- 	"microsoft/vscode-js-debug",
  -- 	lazy = true,
  -- 	build = "git reset --hard main && npm install && npm run compile",
  -- },

  -- {
  -- 	{
  -- 		"codota/tabnine-nvim",
  -- 		build = "./dl_binaries.sh",
  -- 		config = function()
  -- 			require("plugins.tabnine")
  -- 		end,
  -- 	},
  -- },

  -- {
  -- 	"mxsdev/nvim-dap-vscode-js",
  -- 	dependencies = { "mfussenegger/nvim-dap" },
  -- 	config = function()
  -- 		require("plugins.nvim-dap-vscode-js")
  -- 	end,
  -- },

  -- {
  --   "nvim-neorg/neorg",
  --   -- build = ":Neorg sync-parsers",
  --   -- tag = "*",
  --   dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         -- ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         -- ["core.ui.calendar"] = {}, -- Adds pretty icons to your documents
  --         -- ["core.summary"] = {}, -- Adds pretty icons to your documents
  --         -- ["core.presenter"] = {}, -- Adds pretty icons to your documents
  --         -- ["core.completion"] = {}, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- Distant
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },

  -- Jinja2
  {
    "Glench/Vim-Jinja2-Syntax",
  },
  -- Rainbow delimiters
  {
    url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup({ scope = { highlight = highlight } })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  -- Sessions!
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/*",
        "~/.config/nvim",
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
  },

  -- NWM graphical magic
  { "altermo/nwm", branch = "x11" },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    dependencies = { "kkharji/sqlite.lua", { "nvim-telescope/telescope.nvim" } },
    config = function()
      require("plugins.legendary")
    end,
  },
})
