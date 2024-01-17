local M = {}

local update_font_size = function(font_size)
	M.current_font_size = font_size

  	vim.o.guifont = vim.g.default_gui_font .. ':h' .. M.current_font_size
end

local get_final_count = function(count)
	if count == 0 then
		count = 1
	end

	return count
end

M.set_font_size = function(size)
  if size == 0 then
    return
  end

  update_font_size(size)
end

M.reset_font_size = function()
	update_font_size(vim.g.default_font_size)
end

M.increase_font_size = function(count)
	count = get_final_count(count)

	update_font_size(M.current_font_size + count)
end

M.decrease_font_size = function(count)
	count = get_final_count(count)

	update_font_size(M.current_font_size - count)
end

return M
