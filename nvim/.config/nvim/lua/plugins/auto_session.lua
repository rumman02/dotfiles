return {
  "rmagatti/auto-session",
	event = { "VimLeavePre" },
	cmd = { "SessionRestore", "SessionSave" },
  opts = {
		enabled = true,
		auto_save = true,
		auto_restore = false,
    suppressed_dirs = AUTO_SESSION_SUPPRESSED_DIRS,
		lazy_support = true,
		close_unsupported_windows = true,
		continue_restore_on_error =  true,
		session_lens = {
			load_on_setup = true,
			previewer = true,
			theme_conf = {
				layout_strategy = AUTO_SESSION_LAYOUT_STRATEGY,
				sorting_strategy = AUTO_SESSION_SORTING_STRATEGY,
				layout_config = {
					horizontal = {
						height = AUTO_SESSION_UI_HORIZONTAL_HEIGHT,
						preview_cutoff = AUTO_SESSION_UI_HORIZONTAL_PREVIEW_CUTOFF,
						preview_width = AUTO_SESSION_UI_HORIZONTAL_PREVIEW_WIDTH,
						prompt_position = AUTO_SESSION_UI_HORIZONTAL_PROMPT_POSITION,
						width = AUTO_SESSION_UI_HORIZONTAL_WIDTH
					},
					vertical = {
						height = AUTO_SESSION_UI_VERTICAL_HEIGHT,
						preview_cutoff = AUTO_SESSION_UI_VERTICAL_PREVIEW_CUTOFF,
						preview_width = AUTO_SESSION_UI_VERTICAL_PREVIEW_WIDTH,
						prompt_position = AUTO_SESSION_UI_VERTICAL_PROMPT_POSITION,
						width = AUTO_SESSION_UI_VERTICAL_WIDTH
					}
				},
				winblend = AUTO_SESSION_UI_WINDOW_BLEND,
				prompt_prefix = AUTO_SESSION_PROMPT_PREFIX,
				selection_caret = AUTO_SESSION_SELECTION_CARET,
				border = true,
				borderchars =  AUTO_SESSION_UI_BORDER_STYLE,
				results_title = AUTO_SESSION_RESULTS_TITLE,
				prompt_title = AUTO_SESSION_PROMPT_TITLE,
			},
			mappings = {
				delete_session = { "n", "d" },
				alternate_session = { "n", "s" },
				copy_session = { "n", "y" },
			},
		}
  }
}

