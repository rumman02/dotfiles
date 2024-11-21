return {
	"mrjones2014/smart-splits.nvim",
	event = { "WinEnter", "BufEnter" },
	dependencies = {
		"kwkarlwang/bufresize.nvim",
	},
	version = ">=1.0.0",
	config = function ()
		local smart_splits = REQUIRE("smart-splits")
		local bufresize = REQUIRE("bufresize")

		bufresize.setup({})
		smart_splits.setup({
			ignored_buftypes = {
				-- "neo-tree"
			},
			ignored_filetypes = {
				-- "neo-tree"
			},
			default_amout = 1,
			move_cursor_same_row = false,
			resize_mode = {
				quit_key = "<esc>",
				resize_keys = { "h", "j", "k", "l" },
				silent = false,
				hooks = {
					on_enter = function ()
					end,
					on_leave = function ()
						bufresize.register()
					end
				},
				ignored_events = {}
			}
		})
	end
}

