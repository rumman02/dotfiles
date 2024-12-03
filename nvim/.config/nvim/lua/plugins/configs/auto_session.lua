local auto_session = require("auto-session")

auto_session.setup({
	enabled = true,
	auto_save = true,
	auto_restore = false,
	suppressed_dirs = {},
	lazy_support = true,
	close_unsupported_windows = true,
	continue_restore_on_error =  true,
	session_lens = {
		load_on_setup = true,
		previewer = true,
		theme_conf = {
			layout_strategy = TELESCOPE_LAYOUT_STRATEGY,
			sorting_strategy = TELESCOPE_SORTING_STRATEGY,
			layout_config = {
				horizontal = {
					height = UI_HEIGHT,
					preview_cutoff = TELESCOPE_UI_PREVIEW_CUTOFF,
					preview_width = TELESCOPE_UI_PREVIEW_WIDTH,
					prompt_position = UI_TITLE_POSITION,
					width = UI_WIDTH
				},
				vertical = {
					height = UI_HEIGHT,
					preview_cutoff = TELESCOPE_UI_PREVIEW_CUTOFF,
					preview_width = TELESCOPE_UI_PREVIEW_WIDTH,
					prompt_position = UI_TITLE_POSITION,
					width = UI_WIDTH
				}
			},
			winblend = UI_WINDOW_BLEND,
			prompt_prefix = TELESCOPE_PROMPT_PREFIX,
			selection_caret = TELESCOPE_SELECTION_CARET,
			border = true,
			borderchars =  UI_BORDER_STYLE,
			results_title = TELESCOPE_RESULTS_TITLE,
			prompt_title = TELESCOPE_PROMPT_TITLE,
		},
		mappings = {
			delete_session = { "n", "d" },
			alternate_session = { "n", "s" },
			copy_session = { "n", "y" },
		},
	}
})

