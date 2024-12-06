local ultimate_autopair = require("ultimate-autopair")

ultimate_autopair.setup({
	extensions = {
		cmdtype = {
			skip = {
				"/",
				"?",
				"@",
				"-",
				":",
			},
			p = 100,
		},
	},
})

