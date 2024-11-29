return {
	"folke/which-key.nvim",
	event = { "VeryLazy" },
	opts = {
		preset = "classic",
		delay = 0,
		notify = true,
		triggers = {
			{ "<auto>", mode = "nicvxso" },
			{ "<leader>", mode = "nicvxso" },
			{ "s", mode = "nicvxso" },
			{ "\\", mode = "nicvxso" },
		},
		win = {
			no_overlap = false,
			border = WHICH_KEY_UI_BORDER_STYLE,
			title_pos = WHICH_KEY_UI_TITLE_POSITION
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
		}
	}
}

