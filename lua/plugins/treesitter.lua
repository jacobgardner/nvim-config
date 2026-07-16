local treesitter = require("nvim-treesitter")

treesitter.setup()
treesitter.install({ "rust", "typescript", "javascript", "lua", "hcl", "python", "markdown", "markdown_inline" })

require("nvim-ts-autotag").setup()
