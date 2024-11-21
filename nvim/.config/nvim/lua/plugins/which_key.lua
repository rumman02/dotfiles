return {
	"folke/which-key.nvim",
	event = { "VeryLazy" },
	opts = {
		preset = WHICH_KEY_UI_PRESET,
		delay = 0,
		notify = true,
		triggers = WHICH_KEY_TIGGERS,
		win = {
			no_overlap = false,
			border = WHICH_KEY_UI_BORDER_STYLE,
			title_pos = WHICH_KEY_UI_TITLE_POSITION
		},
		replace = WHICH_KEY_REPLACE,
		icons = {
			breadcrumb = WHICH_KEY_SYMBOLS_BREADCRUMB_ICON,
			separator = WHICH_KEY_SYMBOLS_SEPARATOR_ICON,
			group = WHICH_KEY_SYMBOLS_GROUP_ICON,
			rules = false,
		},
		disable = WHICH_KEY_DISABLE
	}
}

