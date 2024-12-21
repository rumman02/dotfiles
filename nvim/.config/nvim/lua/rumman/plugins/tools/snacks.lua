local snacks = require("snacks")

snacks.setup({
	indent = { enabled = true },
	input =  { enabled = true },
	notifier = { enabled = true },
	rename = { enabled = true },
	scroll = {
		enabled = true,
		animate = {
			duration = { step = 15, total = 150 },
			easing = "linear",
		}
	},
	statuscolumn = { enabled = true },
	win = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

