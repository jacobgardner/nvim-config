local wk = require("which-key")

wk.setup({
	window = {
		border = "single",
	},
})

wk.register({
	["<leader>t"] = {
		name = "+toggle",
	},
})

wk.register({
	["<leader>r"] = {
		name = "+reload",
	},
})

wk.register({
	["<leader>z"] = {
		name = "+zoom",
	},
})

-- Not sure what key we want for this
wk.register({
	["<leader>p"] = {
		name = "+find (files, buffers, etc.)",
	},
})

wk.register({
	["<leader>g"] = {
		name = "+go to (defintion, implementation, etc.)",
	},
})

wk.register({
  ["<leader>w"] = {
    name = "+workspace (add, remove, list...)"
  }
})

wk.register({
  ["<leader>e"] = {
    name = "+edit (keymaps, plugins, etc...)"
  }
})


wk.register({
  ["<leader>c"] = {
    name = "+code action (...)"
  }
})

wk.register({
  ["<leader>d"] = {
    name = "+debug action (breakpoint, step over, etc.)"
  }
})
