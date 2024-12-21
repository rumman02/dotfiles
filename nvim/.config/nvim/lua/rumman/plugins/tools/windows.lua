local smart_splits = require("smart-splits")
local bufresize = require("bufresize")
local windows = require("windows")

bufresize.setup({})
windows.setup({
	autowidth = {
		enable = false,
	}
})

smart_splits.setup({
	default_amout = 1,
	ignored_filetypes = {
		"neotree",
	},
	ignored_buftypes = {
	},
	resize_mode = {
		silent = false,
		hooks = {
			on_enter = function() end,
			on_leave = function()
				bufresize.register()
			end,
		},
	},
})

