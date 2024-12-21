local noice = require("noice")

local icons = require("rumman.lib.icons")

noice.setup({
	cmdline = {
		format = {
			cmdline = { icon = icons.ui.ArrowLongRight },
			search_down = { icon = icons.ui.Search .. icons.ui.ArrowDownRigth },
			search_up = {  icon = icons.ui.Search .. icons.ui.ArrowUpRigth },
			filter = { icon = icons.ui.Filter },
			lua = { icon = icons.lang.Lua },
			help = {  icon = icons.diagnostics.Help },
			input = {  icon = icons.ui.Keyboard },
		}
	},
	messages = {
		view_search = false,
	},
	lsp = {
		progress = {
			enabled = false,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			view = "mini",
		},
	},
	format = {
		level = {
			icons = {
				error = icons.diagnostics.Error,
				warn = icons.diagnostics.Warning,
				info = icons.diagnostics.Information,
				hint = icons.diagnostics.Hint,
			},
		},
	},

})

