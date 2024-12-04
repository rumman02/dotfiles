local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = {
			bufferline.style_preset.default,
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold
		},
		themable = true,
		indicator = {
			icon = "▎",
			style = "icon",
		},
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Explorer",
				text_align = "center",
				separator = true,
				highlight = "Directory",
			}
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		move_wraps_at_ends = true,
		separator_style = "slope",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		auto_toggle_bufferline = true,
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
	}
})

