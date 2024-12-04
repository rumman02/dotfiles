local which_key = require("which-key")

which_key.setup({
	preset = "classic",
	delay = 0,
	notify = true,
	triggers = {
		{ "<auto>", mode = "nicvxso" },
		{ "<leader>", mode = "nicvxso" },
		{ "\\", mode = "nicvxso" },
		{ INSERTLEADER, mode = "nicvxso" },
	},
	win = {
		no_overlap = false,
		border = UI_BORDER_STYLE,
		title_pos = UI_TITLE_POSITION
	},
	replace = {
		key = {
			{ "<Space>", "Leader" }
		}
	},
	icons = {
		breadcrumb = " ",
		separator = " ",
		group = "+",
		rules = false,
	},
	disable ={
		ft = {"alpha"},
	},
	sort = {
		"alphanum",
	}
})

