require("legendary").setup({
	keymaps = {
		{ "<C-p>", "<cmd>Legendary<CR>", description = "Legendary (Command Palette)" },
		{
			"<C-f>",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			description = "Format Buffer",
			mode = { "n" },
		},
		{
			"<C-n>",
			"<cmd>Neotree position=right focus<CR>",
			description = "Focus Neotree",
		},
		{
			"<leader>rl",
			function()
				vim.cmd("luafile %")
				vim.notify("Reloaded " .. vim.api.nvim_buf_get_name(0))
			end,
			description = "Reload current lua config (neovim)",
		},
		{
			"<Tab>",
			"<cmd>BufferLineCycleNext<CR>",
			description = "  goto next buffer",
		},
		{
			"<S-Tab>",
			"<cmd>BufferLineCyclePrev<CR>",
			description = "  goto prev buffer",
		},
		{
			"<A-h>",
			"<cmd>BufferLineMovePrev<CR>",
			description = "  move buffer to next position",
		},
		{
			"<A-l>",
			"<cmd>BufferLineMoveNext<CR>",
			description = "  move buffer to prev position",
		},

		{
			"<A-H>",
			"<cmd>BufferLineCloseLeft<CR>",
			description = "  delete buffers to the left",
		},
		{
			"<A-L>",
			"<cmd>BufferLineCloseRight<CR>",
			description = "  delete buffers to the right",
		},
		{
			"<leader>tP",
			require("util.profile").toggle_profile,
			description = "Toggle plugin profiling...",
		},
		{
			"<leader>pp",
			function()
				require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))
			end,
			description = "Find files in workspace",
		},
		{
			"<leader>pg",
			function()
				require("telescope.builtin").grep_string({})
			end,
			description = "Grep via telescope",
		},
		{
			"<leader>pb",
			function()
				require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))
			end,
			description = "Find buffers",
		},
		{
			"<leader>pk",
			function()
				require("telescope.builtin").keymaps({})
			end,
			description = "Find normal mode keymap",
		},
		{
			"<leader>pt",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols({})
			end,
			description = "Find LSP workspace symbol",
		},
		{
			"<leader>ph",
			function()
				require("telescope.builtin").lsp_references({ initial_mode = "normal" })
			end,
			description = "Find LSP References to selected symbol",
		},
		{
			"<leader>pi",
			function()
				require("telescope.builtin").lsp_implementations({ initial_mode = "normal" })
			end,
			description = "Find LSP implementations for the selected symbol",
		},
		{
			"<leader>ps",
			"<CMD>GrugFar<CR>",
			description = "Workspace Find/Replace",
			mode = { "n", "v" },
		},
		{
			"<A-j>",
			"<CMD>move .+1<CR>==",
			description = "Move current line down",
		},
		{
			"<A-k>",
			"<CMD>move .-2<CR>==",
			description = "Move current line up",
		},
		{
			"<A-j>",
			"<ESC><CMD>move .+1<CR>==gi",
			description = "Move current line down (insert mode)",
			mode = { "i" },
		},
		{
			"<A-k>",
			"<ESC><CMD>move .-2<CR>==gi",
			description = "Move current line up (insert mode)",
			mode = { "i" },
		},
		{
			"<A-j>",
			"<CMD>move '>+1<CR>gv=gv",
			description = "Move selected text down",
			mode = { "v" },
		},
		{
			"<A-k>",
			"<CMD>move '<-2<CR>gv=gv",
			description = "Move selected text up",
			mode = { "v" },
		},
		{
			"<C-h>",
			"<C-W>h",
			description = "Move to left window",
		},
		{
			"<C-j>",
			"<C-W>j",
			description = "Move to lower window",
		},
		{
			"<C-k>",
			"<C-W>k",
			description = "Move to upper window",
		},
		{
			"<C-l>",
			"<C-W>l",
			description = "Move to right window",
		},
		{
			"<C-tab>",
			"<CMD>tabnext<CR>",
			description = "Go to next tab",
		},
		{
			"<C-S-tab>",
			"<CMD>tabprev<CR>",
			description = "Go to previous tab",
		},
		{
			"<leader>ca",
			"<CMD>Lspsaga code_action<CR>",
			description = "Show code action menu",
			mode = { "v", "n" },
		},
		{
			"<leader>s",
			"<CMD>Lspsaga hover_doc<CR>",
			description = "Show lsp hover doc",
		},
		{
			"gh",
			"<CMD>Lspsaga lsp_finder<CR>",
			description = "LSP References",
		},
		{
			"K",
			"<cmd>Lspsaga hover_doc<CR>",
			description = "Show hover doc",
		},
		{
			"gs",
			"<Cmd>Lspsaga signature_help<CR>",
			description = "Show signature",
		},
		{
			"gr",
			"<cmd>Lspsaga rename<CR>",
			description = "Rename token under cursor",
		},
		{
			"<F2>",
			"<cmd>Lspsaga rename<CR>",
			description = "Rename token under cursor",
		},
		{
			"gd",
			vim.lsp.buf.definition,
			description = "Go to definition of the token under cursor.",
		},
		{
			"<leader>cd",
			"<cmd>Lspsaga show_line_diagnostics<CR>",
			description = "Show diagnostics for the line",
		},
		{
			"<A-n>",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			description = "Jump to next diagnostic",
		},
		{
			"<A-N>",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			description = "Jump to previous diagnostic",
		},
		{
			"<leader>tf",
			"<cmd>Neotree toggle position=right<CR>",
			description = "Toggle file explorer",
		},
	},

	--   -- map keys to a command
	--   { '<leader>ff', ':Telescope find_files', description = 'Find files' },
	--   -- map keys to a function
	--   {
	--     '<leader>h',
	--     function()
	--       print('hello world!')
	--     end,
	--     description = 'Say hello',
	--   },
	--   -- Set options used during keymap creation
	--   { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = true } },
	--   -- create keymaps with different implementations per-mode
	--   {
	--     '<leader>c',
	--     { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
	--     description = 'Toggle comment',
	--   },
	--   -- create item groups to create sub-menus in the finder
	--   -- note that only keymaps, commands, and functions
	--   -- can be added to item groups
	--   {
	--     -- groups with same itemgroup will be merged
	--     itemgroup = 'short ID',
	--     description = 'A submenu of items...',
	--     icon = '',
	--     keymaps = {
	--       -- more keymaps here
	--     },
	--   },
	--   -- in-place filters, see :h legendary-tables or ./doc/table_structures/README.md
	--   { '<leader>m', description = 'Preview markdown', filters = { ft = 'markdown' } },
	-- },
	-- commands = {
	--   -- easily create user commands
	--   {
	--     ':SayHello',
	--     function()
	--       print('hello world!')
	--     end,
	--     description = 'Say hello as a command',
	--   },
	--   {
	--     -- groups with same itemgroup will be merged
	--     itemgroup = 'short ID',
	--     -- don't need to copy the other group data because
	--     -- it will be merged with the one from the keymaps table
	--     commands = {
	--       -- more commands here
	--     },
	--   },
	--   -- in-place filters, see :h legendary-tables or ./doc/table_structures/README.md
	--   { ':Glow', description = 'Preview markdown', filters = { ft = 'markdown' } },
	-- },
	-- funcs = {
	--   -- Make arbitrary Lua functions that can be executed via the item finder
	--   {
	--     function()
	--       doSomeStuff()
	--     end,
	--     description = 'Do some stuff with a Lua function!',
	--   },
	--   {
	--     -- groups with same itemgroup will be merged
	--     itemgroup = 'short ID',
	--     -- don't need to copy the other group data because
	--     -- it will be merged with the one from the keymaps table
	--     funcs = {
	--       -- more funcs here
	--     },
	--   },
	-- },
	-- autocmds = {
	--   -- Create autocmds and augroups
	--   { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
	--   {
	--     name = 'MyAugroup',
	--     clear = true,
	--     -- autocmds here
	--   },
	-- },
	-- load extensions
	extensions = {
		-- automatically load keymaps from lazy.nvim's `keys` option
		lazy_nvim = false,
		-- load commands from smart-splits.nvim
		-- and create keymaps, see :h legendary-extensions-smart-splits.nvim
		-- smart_splits = {
		--   directions = { 'h', 'j', 'k', 'l' },
		--   mods = {
		--     move = '<C>',
		--     resize = '<M>',
		--   },
		-- },
		-- -- load commands from op.nvim
		-- op_nvim = true,
		-- -- load keymaps from diffview.nvim
		-- diffview = true,
	},
})
