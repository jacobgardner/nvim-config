local M = {}

local namespace = vim.api.nvim_create_namespace("typescript-codelens")
local augroup = vim.api.nvim_create_augroup("typescript_codelens", { clear = true })
local state = {}

local function render(bufnr)
	vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

	local buffer_state = state[bufnr]
	if not buffer_state then
		return
	end

	local by_line = {}
	for _, lens in ipairs(buffer_state.lenses) do
		local line = lens.range.start.line
		by_line[line] = by_line[line] or {}
		table.insert(by_line[line], lens)
	end

	for line, lenses in pairs(by_line) do
		table.sort(lenses, function(a, b)
			return a.range.start.character < b.range.start.character
		end)

		local virtual_text = {}
		for index, lens in ipairs(lenses) do
			if index > 1 then
				table.insert(virtual_text, { " | ", "LspCodeLensSeparator" })
			end
			table.insert(virtual_text, { lens.command.title, "LspCodeLens" })
		end

		vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
			virt_text = virtual_text,
			virt_text_pos = "eol",
			hl_mode = "combine",
		})
	end
end

function M.refresh(bufnr)
	local buffer_state = state[bufnr]
	if not buffer_state then
		return
	end

	local client = vim.lsp.get_client_by_id(buffer_state.client_id)
	if not client or not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end

	buffer_state.generation = buffer_state.generation + 1
	local generation = buffer_state.generation
	local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }

	client:request("textDocument/codeLens", params, function(err, lenses)
		if err or state[bufnr] ~= buffer_state or buffer_state.generation ~= generation then
			return
		end

		lenses = lenses or {}
		local pending = #lenses
		local resolved = {}

		local function complete(lens)
			if lens and lens.command then
				table.insert(resolved, lens)
			end
			pending = pending - 1
			if pending == 0 and state[bufnr] == buffer_state and buffer_state.generation == generation then
				buffer_state.lenses = resolved
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(bufnr) then
						render(bufnr)
					end
				end)
			end
		end

		if pending == 0 then
			buffer_state.lenses = {}
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(bufnr) then
					render(bufnr)
				end
			end)
			return
		end

		for _, lens in ipairs(lenses) do
			if lens.command then
				complete(lens)
			else
				client:request("codeLens/resolve", lens, function(_, resolved_lens)
					complete(resolved_lens)
				end, bufnr)
			end
		end
	end, bufnr)
end

function M.attach(bufnr, client_id)
	state[bufnr] = { client_id = client_id, generation = 0, lenses = {} }

	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
		group = augroup,
		buffer = bufnr,
		callback = function()
			M.refresh(bufnr)
		end,
	})
	vim.api.nvim_create_autocmd("LspDetach", {
		group = augroup,
		buffer = bufnr,
		once = true,
		callback = function()
			state[bufnr] = nil
			vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
		end,
	})

	M.refresh(bufnr)
end

function M.run()
	local bufnr = vim.api.nvim_get_current_buf()
	local buffer_state = state[bufnr]
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local candidates = {}

	for _, lens in ipairs(buffer_state and buffer_state.lenses or {}) do
		if lens.range.start.line == line then
			table.insert(candidates, lens)
		end
	end

	local function execute(lens)
		if not lens then
			return
		end
		local client = vim.lsp.get_client_by_id(buffer_state.client_id)
		if client then
			client:exec_cmd(lens.command, { bufnr = bufnr })
		end
	end

	if #candidates == 0 then
		vim.notify("No code lens on the current line", vim.log.levels.INFO)
	elseif #candidates == 1 then
		execute(candidates[1])
	else
		vim.ui.select(candidates, {
			prompt = "Code lenses: ",
			format_item = function(lens)
				return lens.command.title
			end,
		}, execute)
	end
end

return M
