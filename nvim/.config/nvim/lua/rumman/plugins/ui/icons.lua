local mini_icons = require("mini.icons")
local web_devicons = require("nvim-web-devicons")

web_devicons.setup({})
mini_icons.setup({
	file = {
		[".keep"] = { glyph = "󰊢 ", hl = "MiniIconsGrey" },
		["devcontainer.json"] = { glyph = " ", hl = "MiniIconsAzure" },
	},
	filetype = {
		dotenv = { glyph = " ", hl = "MiniIconsYellow" },
	},
})
mini_icons.mock_nvim_web_devicons()

