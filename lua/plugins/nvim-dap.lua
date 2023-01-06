local dap = require("dap")

-- dap.setup()

dap.adapters.lldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "C:\\codelldb\\extension\\adapter\\codelldb.exe",
		args = { "--port", "${port}" },

		detached = false,
	},
}

vim.fn.sign_define('DapBreakpoint', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='ﰲ', texthl='debugPc', linehl='debugPc', numhl='debugPc'})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
