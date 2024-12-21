local gruvbox = require("gruvbox")
local utils = require("rumman.lib.utils")

gruvbox.setup({
	contrast = "",
	overrides = {
		SignColumn = { bg = "none" },
		FlashLabel = { fg = "#fabd2f" },
		DiagnosticSignError	= { fg = "#fb4934", bg = "none" },
		DiagnosticSignHint = { fg = "#8ec07c", bg = "none" },
		DiagnosticSignWarn = { fg = "#fabd2f", bg = "none" },
		MiniIndentscopeSymbol = { fg = "#fe8019", bg = "none" },
		WinSeparator = { fg = "#212121", bg = "none" },
		NeoTreeNormal = { fg = "none", bg = "#212121" },
		NeoTreeNormalNC = { fg = "none", bg = "#212121" },
		TelescopeTitle = { fg = "#665c54", bg = "none" },
		TelescopeResultsBorder = { fg = "#665c54", bg = "none" },
		TelescopePreviewBorder = { fg = "#665c54", bg = "none" },
		TelescopePromptBorder = { fg = "#665c54", bg = "none" },
		WhichKeyBorder = { fg = "#665c54", bg = "none" },
		WhichKeyNormal = { fg = "#665c54", bg = "none" },
		TroubleNormal = { fg = "none", bg = "#212121" },
		TroubleNormalNC = { fg = "none", bg = "#212121" },
		TroubleCount = { fg = "#b8bb26", bg = "#212121" },
	},
	dim_inactive = false,
	transparent_mode = utils.ui.transparent,
})

if utils.colorscheme == "gruvbox" then
	vim.cmd.colorscheme "gruvbox"
end

