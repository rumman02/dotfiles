local noice = require("noice")

noice.setup({
	cmdline = {
		view = "cmdline_popup",
		format = {
			cmdline = { icon = "" },
			search_down = { icon = " " },
			search_up = { icon = " " },
			filter = { icon = "$" },
			lua = { icon = "" },
			help = { icon = "" },
			input = { icon = "󰥻" },
		}
	},
	messages = {
		view_search = false
	},
	format = {
		level = {
			icons = {
				error = "✖",
				warn = "▼",
				info = "●",
			},
		},
	}
})

