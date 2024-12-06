local barbar = require("barbar")

barbar.setup({
	icons = {
		button = false,
	},
	sidebar_filetypes = {
		["neo-tree"] = {
			event = "BufWipeout",
		},
	},
})

