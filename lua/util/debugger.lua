local M = {}

M.searchUpForFile = function(current_dir, file)
	local loop_count = 0
	local full_path = nil
	local opened_file = nil

	while true do
		loop_count = loop_count + 1
		full_path = vim.fn.resolve(current_dir .. "/" .. file)
		opened_file = io.open(full_path, "r")

		if loop_count >= 100 then
			break
		end

		if opened_file then
			break
		end

		current_dir = vim.fn.resolve(current_dir .. "/..")
		if current_dir == vim.fn.resolve("/") then
			break
		end
	end

	if opened_file then
		return full_path
	end

	return nil
end

M.rerootDebugger = function()
	-- Search for package.json

	local current_dir = vim.fn.expand("%:h")

	local launch_path = M.searchUpForFile(current_dir, ".vscode/launch.json")

	if launch_path == nil then
		print("No launch.json found")
		return
	end

	print("Loading launch.json..")
	require("dap.ext.vscode").load_launchjs(launch_path, {
		["pwa-node"] = { "javascript", "typescript" },
		lldb = { "rust" },
	})
end

M.with_setup = function(after)
	local dap = require("dap")

	if dap.session() == nil then
		M.rerootDebugger()
	end

	after()
end

return M
