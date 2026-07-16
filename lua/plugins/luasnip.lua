local luasnip = require("luasnip")

luasnip.config.set_config({
	keep_roots = true,
	link_roots = true,
	link_children = true,
	exit_roots = false,
	update_events = { "TextChanged", "TextChangedI" },
})
require("luasnip.loaders.from_vscode").load()
