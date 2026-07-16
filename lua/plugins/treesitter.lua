local treesitter = require("nvim-treesitter")
local parsers = { "rust", "typescript", "javascript", "lua", "hcl", "python", "markdown", "markdown_inline" }

treesitter.setup()

local installed = treesitter.get_installed()
local missing = vim.tbl_filter(function(parser)
	return not vim.list_contains(installed, parser)
end, parsers)

if #missing > 0 then
	treesitter.install(missing):wait(300000)
end

require("nvim-ts-autotag").setup()
