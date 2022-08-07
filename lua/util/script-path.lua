local M = {}

M.script_paths = {}

M.register_script = function(script_name)
	local path = debug.getinfo(2, "S").source:sub(2)

	if script_name ~= nil then
		M.script_paths[script_name] = path
	end

	return path
end

M.get_script_path = function(script_name)

  local path = M.script_paths[script_name]


	return path
end

return M
