local M = {}

-- TODO: Just move this into keymaps.lua

---@diagnostic disable-next-line: unused-local
M.on_attach = function(_client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", bufopts, { desc = "Declaration" }))
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", bufopts, { desc = "Definition" }))
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", bufopts, { desc = "Hover information" }))
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", bufopts, { desc = "Implementation" }))
	-- vim.keymap.set(
	-- 	{ "n", "i" },
	-- 	"<C-k>",
	-- 	vim.lsp.buf.signature_help,
	-- 	vim.tbl_extend("force", bufopts, { desc = "Signature Help" })
	-- )
	vim.keymap.set(
		"n",
		"<space>wa",
		vim.lsp.buf.add_workspace_folder,
		vim.tbl_extend("force", bufopts, { desc = "Add folder to workspace" })
	)
	vim.keymap.set(
		"n",
		"<space>wr",
		vim.lsp.buf.remove_workspace_folder,
		vim.tbl_extend("force", bufopts, { desc = "Remove folder from workspace" })
	)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, vim.tbl_extend("force", bufopts, { desc = "List folders in workspace" }))
	vim.keymap.set(
		"n",
		"<space>D",
		vim.lsp.buf.type_definition,
		vim.tbl_extend("force", bufopts, { desc = "Type definition" })
	)
	-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("force", bufopts, { desc = "Rename (lsp)" }))
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<space>ca",
	-- 	vim.lsp.buf.code_action,
	-- 	vim.tbl_extend("force", bufopts, { desc = "Show code actions" })
	-- )
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", bufopts, { desc = "Show references" }))
end

return M
