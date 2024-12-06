local smart_splits = require("smart-splits")
local bufresize = require("bufresize")

smart_splits.setup({
	ignored_buftypes = {},
	ignored_filetypes = {},
	default_amout = 1,
	move_cursor_same_row = false,
	resize_mode = {
		quit_key = "<esc>",
		resize_keys = { "h", "j", "k", "l" },
		silent = false,
		hooks = {
			on_enter = function() end,
			on_leave = function()
				bufresize.register()
			end,
		},
		ignored_events = {},
	},
})

