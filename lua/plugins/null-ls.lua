local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
  -- groovy/Jenkinsfile
  b.diagnostics.npm_groovy_lint,
  b.formatting.npm_groovy_lint,

  -- Bazel Buildifier
  b.diagnostics.buildifier,
  b.formatting.buildifier,

	-- -- Typescript stuff
	b.formatting.prettier,
	-- b.diagnostics.tsc,

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- Python
	b.formatting.autopep8,

  -- Terraform
  b.formatting.terraform_fmt
}

null_ls.setup({
	debug = false,
	sources = sources,
	-- on_attach = function(client, bufnr)
	-- 	vim.keymap.set({ "n", "i" }, "<C-i>", function()
	-- 		local util = require("vim.lsp.util")
	-- 		local params = util.make_formatting_params({})
	-- 		client.request("textDocument/formatting", params, nil, bufnr)
  -- end,
	-- 	end, { buffer = bufnr })
})
