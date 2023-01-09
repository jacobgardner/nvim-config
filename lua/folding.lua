vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = '1'

vim.api.nvim_create_autocmd({"BufReadPost", "FileReadPost"}, {
  pattern = "*",

  command = ":set foldlevel=99"
})
