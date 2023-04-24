local nvimTree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimTree.setup({
	open_on_setup = true,
	open_on_setup_file = true,
  -- focus_empty_on_setup = true,
  hijack_cursor = true,
	view = {
		side = "right",
		-- float = {
		-- 	enable = true,
		-- },
	},
	diagnostics = {
		enable = true,
    show_on_dirs = true,
	},
  update_focused_file = {
    enable = true
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    group_empty = true,
    full_name = true,
    icons = {
      git_placement = "signcolumn"
    },
    indent_markers = {
      enable = true,
    }
  }
})
