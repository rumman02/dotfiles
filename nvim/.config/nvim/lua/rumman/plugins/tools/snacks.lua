local snacks = require("snacks")
local icons = require("rumman.lib.icons")

snacks.setup({
	indent = {
		enabled = true,
		char = icons.ui.BorderLeft,
		chunk = {
			char = {
				corner_top = icons.ui.BorderTopLeft,
				corner_bottom = icons.ui.BorderBottomLeft,
				horizontal = icons.ui.BorderTop,
				vertical = icons.ui.BorderLeft,
				arrow = icons.ui.Arrow,
			},
		},
	},
	input = { enabled = false },
	notifier = {
		enabled = true,
		timeout = 2000,
		icons = {
			error = icons.diagnostics.Error,
			warn = icons.diagnostics.Warning,
			info = icons.diagnostics.Information,
			debug = icons.ui.Debug,
			trace = icons.ui.Trace,
		},
	},
	rename = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = false },
	win = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

