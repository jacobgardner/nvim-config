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
