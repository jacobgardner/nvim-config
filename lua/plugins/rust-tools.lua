local lsp_keybinds = require("util.lsp_keybinds")

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local extension_path = 'C:\\codelldb\\extension'
-- local p = "C:\\codelldb\\extension\\lldb\\bin\\liblldb.dll"

require("rust-tools").setup({
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(
		 extension_path ..	"\\adapter\\codelldb.exe",
			extension_path .. "\\lldb\\bin\\liblldb.dll"
		),
	},
	server = {
		on_attach = lsp_keybinds.on_attach,
		capabilities = capabilities,
	},
})
