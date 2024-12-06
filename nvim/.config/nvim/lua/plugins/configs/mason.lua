local mason = require("mason")

mason.setup({
	ui = {
		icons = {
			package_installed = LOADED_ICON,
			package_pending = PENDING_ICON,
			package_uninstalled = UNLOADED_ICON,
		},
		border = UI_BORDER_STYLE,
		width = UI_WIDTH,
		height = UI_HEIGHT,
	},
})

