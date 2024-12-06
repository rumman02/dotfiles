local indent_blankline = require("ibl")

indent_blankline.setup({
	indent = {
		char = "⏐",
	},
	scope = {
		show_start = false,
		show_end = false,
		include = {
			node_type = { ["*"] = { "*" } },
		},
	},
})

