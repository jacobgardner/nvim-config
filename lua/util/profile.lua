local M = {}

local get_filename = function()
	local datetime = os.date("%Y-%m-%d-%H-%M-%S")

	return "profile-" .. datetime .. ".log"
end

local is_profiling = false

M.toggle_profile = function()
	if not is_profiling then
		vim.cmd('profile start ' .. get_filename())
    vim.cmd('profile func *')
    vim.cmd('profile file *')
		is_profiling = true
	else
    vim.cmd('profile stop')
		is_profiling = false
	end
end

return M
