local autopairs = require("nvim-autopairs")
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

autopairs.setup({
	disable_filetype = {
		"TelescopePrompt",
		"spectre_panel"
	},
})

