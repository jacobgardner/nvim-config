if vim.g.vscode then
else
	require("settings")

	require("util.script-path")

	local fs = require("util.font-size")
	fs.reset_font_size()

	require("plugins.init")

	require("keymaps")

	require("autocmds")
	require("folding")
	require("utils")

	vim.opt.cmdheight = 1

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.jakecode = {
		install_info = {
			url = "~/tree-sitter-code", -- local path or git repo
			files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
			-- optional entries:
			branch = "main", -- default branch in case of git repo if different from master
			generate_requires_npm = false, -- if stand-alone parser without npm dependencies
			requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
		},
		filetype = "code", -- if filetype does not match the parser name
	}
end
