local fs = require("util.font-size")
local debugger = require("util.debugger")

vim.opt.updatetime = 300
vim.opt.swapfile = false

local script_paths = require("util.script-path")
script_paths.register_script("keymaps")

-- vim.api.nvim_clear_autocmds({
-- 	event = { "CursorHold" },
-- })

vim.keymap.set("i", "<C-BS>", "<C-w>", {})
vim.keymap.set("i", "<C-h>", "<C-w>", {})

-- vim.keymap.set({ "n" }, "<leader>ek", function()
-- 	vim.cmd("edit " .. script_paths.get_script_path("keymaps"))
-- end, {
-- 	desc = "Edit Keymaps",
-- })

-- vim.keymap.set({ "n" }, "<leader>tc", function()
-- 	local baleia = require("baleia").setup()
--
-- 	baleia.once(0)
-- end, {
-- 	desc = "ANSI Colorize",
-- })

-- vim.keymap.set({ "n", "i" }, "<C-f>", function()
-- 	vim.lsp.buf.format({ async = true })
-- end, {})
--
--
-- vim.keymap.set("n", "<C-n>", "<cmd>Neotree position=right toggle<CR>", {})
-- vim.keymap.set("n", "<C-A-n>", "<cmd>Neotree position=right toggle<CR>", {})
-- vim.keymap.set("n", "<leader>tp", "<cmd>TroubleToggle<CR>", { desc = "Toggle Problems Panel" })
-- vim.keymap.set("n", "<leader>rl", function()
-- 	vim.cmd("luafile %")
-- 	vim.notify("Reloaded " .. vim.api.nvim_buf_get_name(0))
-- end, { desc = "Reload current luafile config (neovim)" })

-- Allows updating the font-size dynamically when using a gui (neovide)

vim.keymap.set("n", "<leader>z+", function()
	fs.increase_font_size(vim.v.count)
end, { desc = "Increase font-size (supports count prefix)" })

vim.keymap.set("n", "<leader>z0", function()
	fs.reset_font_size()
end, { desc = "Reset font-size to default" })

vim.keymap.set("n", "<leader>z-", function()
	fs.decrease_font_size(vim.v.count)
end, { desc = "Decrease font-size (supports count prefix)" })

vim.keymap.set("n", "<leader>zs", function()
	fs.set_font_size(vim.v.count)
end, { desc = "Set font to a specific size." })

-- -- cycle through buffers
-- vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "  goto next buffer" })
-- vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "  goto prev buffer" })
--
-- -- Move buffer left or right
-- vim.keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "  move buffer to next position" })
-- vim.keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "  move buffer to prev position" })
--
-- We may want a close left/right at some point...
-- BufferLineCloseLeft
--
-- BufferLineCloseRight
-- vim.keymap.set("n", "<A-H>", "<cmd>BufferLineCloseLeft<CR>", { desc = "  delete buffers to the left" })
-- vim.keymap.set("n", "<A-L>", "<cmd>BufferLineCloseRight<CR>", { desc = "  delete buffers to the right" })
--
-- -- Toggle profiling plugins
-- vim.keymap.set("n", "<leader>tP", require("util.profile").toggle_profile, { desc = "Toggle plugin profiling..." })
--
-- -- Telescope
-- vim.keymap.set("n", "<leader>pp", function()
-- 	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))
-- end, { desc = "Find files in workspace" })
--
-- vim.keymap.set("n", "<leader>pg", function()
-- 	require("telescope.builtin").grep_string({})
-- end, { desc = "Grep via telescope" })
--
-- vim.keymap.set("n", "<leader>pb", function()
-- 	require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))
-- end, { desc = "Find buffers" })
--
-- vim.keymap.set("n", "<leader>pk", function()
-- 	require("telescope.builtin").keymaps({})
-- end, { desc = "Find normal mode keymap" })
--
-- vim.keymap.set("n", "<leader>pt", function()
-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols({})
-- end, { desc = "Find LSP workspace symbol" })
--
-- vim.keymap.set("n", "<leader>ph", function()
-- 	require("telescope.builtin").lsp_references({
-- 		initial_mode = "normal",
-- 	})
-- end, { desc = "Find LSP References to selected symbol" })
--
-- vim.keymap.set("n", "<leader>pi", function()
-- 	require("telescope.builtin").lsp_implementations({
-- 		initial_mode = "normal",
-- 	})
-- end, { desc = "Find LSP implementations for the selected symbol" })
--
-- -- Spectre
--
-- vim.keymap.set({ "n", "v" }, "<leader>ps", function()
-- 	require("spectre").open_visual({ select_word = true })
-- end, { desc = "Workspace Find/Replace" })
--
-- -- Toggle Term
-- vim.cmd([[autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
-- --
-- vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
-- -- vim.keymap.set({ "n", "v", "i" }, "<C-t>", "<CMD>ToggleTerm direction=horizontal<CR>", {})
--
-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	-- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-esc>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- 	-- vim.api.nvim_buf_set_keymap(0, "t", "<C-f1>", [[<C-\><C-n><C-f1>]], opts)
-- 	--
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-V>", "<CMD>put<CR>", opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--
-- vim.keymap.set("n", "<leader>?", "<CMD>Cheatsheet<CR>", {})
--
-- -- Move current line up/down
-- vim.keymap.set("n", "<A-j>", "<CMD>move .+1<CR>==", {})
-- -- Move the current line to just below the line at relative position -2. == readjusts tab level to new line
-- vim.keymap.set("n", "<A-k>", "<CMD>move .-2<CR>==", {})
-- vim.keymap.set("i", "<A-j>", "<ESC><CMD>move .+1<CR>==gi", {})
-- vim.keymap.set("i", "<A-k>", "<ESC><CMD>move .-2<CR>==gi", {})
-- -- TODO: These don't seem to work right... Supposed to moved selected text up/down
-- vim.keymap.set("v", "<A-j>", "<CMD>move '>+1<CR>gv=gv", {})
-- vim.keymap.set("v", "<A-k>", "<CMD>move '<-2<CR>gv=gv", {})
--
-- -- Window Movement / Resizing
-- vim.keymap.set("n", "<C-h>", "<C-W>h", {})
-- vim.keymap.set("n", "<C-j>", "<C-W>j", {})
-- vim.keymap.set("n", "<C-k>", "<C-W>k", {})
-- vim.keymap.set("n", "<C-l>", "<C-W>l", {})
--
-- -- Tab keymaps
-- vim.keymap.set("n", "<C-tab>", "<CMD>tabnext<CR>", {})
-- vim.keymap.set("n", "<C-S-tab>", "<CMD>tabprev<CR>", {})
--
-- -- TODO: Below this line are a lot of the default keymaps and need to be changed
--
-- -- LSP Code Actions
-- vim.keymap.set(
-- 	{ "v", "n" },
-- 	"<leader>ca",
-- 	"<CMD>Lspsaga code_action<CR>",
-- 	{ silent = true, noremap = true, desc = "Show code action menu" }
-- )
-- -- vim.keymap.set(
-- -- 	"v",
-- -- 	"<leader>ca",
-- -- 	"<cmd><C-U>Lspsaga range_code_action<CR>",
-- -- 	{ silent = true, noremap = true, desc = "Show code action menu" }
-- -- )
--
-- vim.keymap.set(
-- 	{ "n" },
-- 	"<leader>s",
-- 	"<CMD>Lspsaga hover_doc<CR>",
-- 	{ desc = "Show lsp hover doc", silent = true, noremap = true }
-- )
-- vim.keymap.set("n", "gh", "<CMD>Lspsaga lsp_finder<CR>", { silent = true, noremap = true, desc = "LSP References" })
-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Show hover doc" })
-- vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true, desc = "Show signature" })
-- vim.keymap.set(
-- 	"n",
-- 	"gr",
-- 	"<cmd>Lspsaga rename<CR>",
-- 	{ silent = true, noremap = true, desc = "Rename token under cursor" }
-- )
-- vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
--
-- -- vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
-- vim.keymap.set("n", "gd", function()
-- 	require("telescope.builtin").lsp_definitions({})
-- end, { silent = true, desc = "Go to definition of the token under cursor." })
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>cd",
-- 	"<cmd>Lspsaga show_line_diagnostics<CR>",
-- 	{ silent = true, noremap = true, desc = "Show diagnostics for the line" }
-- )
--
-- vim.keymap.set("n", "<A-n>", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
-- vim.keymap.set("n", "<A-N>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
--
-- vim.keymap.set("n", "<leader>ts", "<cmd>SymbolsOutline<CR>", {
-- 	desc = "Toggle symbols outline",
-- })
-- vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeToggle<CR>", {
-- 	desc = "Toggle file explorer",
-- })
--
-- -- Debugging
-- vim.keymap.set("n", "<F5>", function()
-- 	debugger.with_setup(function()
-- 		require("dap").continue()
-- 	end)
-- end, { desc = "[Debugging] Continue" })
--
-- vim.keymap.set("n", "<F10>", function()
-- 	debugger.with_setup(function()
-- 		require("dap").step_over()
-- 	end)
-- end, { desc = "[Debugging] Step Over (Next)" })
--
-- vim.keymap.set("n", "<F11>", function()
-- 	debugger.with_setup(function()
-- 		require("dap").step_into()
-- 	end)
-- end, { desc = "[Debugging] Step Into" })
--
-- vim.keymap.set("n", "<F12>", function()
-- 	debugger.with_setup(function()
-- 		require("dap").step_out()
-- 	end)
-- end, { desc = "[Debugging] Step Out Of" })
--
-- vim.keymap.set("n", "<leader>b", function()
-- 	require("dap").toggle_breakpoint()
-- end, { desc = "[Debugging] Toggle Breakpoint" })
--
-- vim.keymap.set("n", "<leader>dB", function()
-- 	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- end, { desc = "[Debugging] Toggle Breakpoint w/ Condition" })
--
-- vim.keymap.set("n", "<leader>dl", function()
-- 	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- end, { desc = "[Debugging] Add log breakpoint" })
--
-- vim.keymap.set("n", "<leader>dr", function()
-- 	debugger.with_setup(function()
-- 		require("dap").repl.open()
-- 	end)
-- end, { desc = "[Debugging] Open repl" })
--
-- vim.keymap.set("n", "<leader>dL", function()
-- 	debugger.with_setup(function()
-- 		require("dap").run_last()
-- 	end)
-- end, { desc = "[Debugging] Run last" })
--
-- vim.keymap.set("n", "<leader>dt", function()
-- 	require("dapui").toggle()
-- end, { desc = "[Debugging] Toggle Debugging UI" })

-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
--
--
-- vim.keymap.set("n", "<leader>ca", '<CMD>CodeActionMenu<CR>', vim.tbl_extend("force", opts, { desc = "Show associated code actions" }))
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--

-- vim.keymap.set('i', '', function() end, {
--   silent = true,
--   expr = true,
-- })

-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
--
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
--
-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
--
