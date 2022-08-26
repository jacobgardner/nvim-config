-- Remove deprecated commands from Neotree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.g.neo_tree_remove_legacy_commands = 1

local nt = require("neo-tree")

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local highlights = require("neo-tree.ui.highlights")

nt.setup({
	renderers = {
		directory = {
			{ "indent" },
			{ "icon" },
			{ "current_filter" },
			{
				"container",
				width = "100%",
				right_padding = 0,
				--max_width = 60,
				content = {
					{ "name", zindex = 10 },
					-- {
					--   "symlink_target",
					--   zindex = 10,
					--   highlight = "NeoTreeSymbolicLinkTarget",
					-- },
					{ "clipboard", zindex = 10 },
					-- { "diagnostics", errors_only = true, zindex = 20, align = "right" },
				},
			},
		},
	},
	filesystem = {
		follow_current_file = true,
		bind_to_cwd = true,
		cwd_target = {
			sidebar = "window",
			current = "window",
		},
		components = {
			-- This is custom to change color of lines with errors
			--  May break with future updates
			name = function(config, node, state)
				local highlight = config.highlight or highlights.FILE_NAME

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_NAME
				end

				if node:get_depth() == 1 then
					highlight = highlights.ROOT_NAME
				else
					local diagnostics = state.components.diagnostics({}, node, state)

					if diagnostics and diagnostics.highlight then
						highlight = diagnostics.highlight
					end
				end

				return {
					text = node.name,
					highlight = highlight,
				}
			end,
		},
	},
})

vim.cmd[[highlight NeoTreeTitleBar guifg=#000000 guibg=#FFFFFF]]
