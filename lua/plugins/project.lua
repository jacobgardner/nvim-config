local project = require("project_nvim")

project.setup({
  -- Try LSP again after fixing neo-tree
  detection_methods = {'pattern'},
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "=nvim" },
  -- Always appears to use starting cwd as root dir
  ignore_lsp = {'null-ls'},
	-- silent_chdir = false,
})
