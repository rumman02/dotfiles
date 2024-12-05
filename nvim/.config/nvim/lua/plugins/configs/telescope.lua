local telescope = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local UI_BORDER_STYLE = {
	UI_BORDER_STYLE[2],
	UI_BORDER_STYLE[4],
	UI_BORDER_STYLE[6],
	UI_BORDER_STYLE[8],
	UI_BORDER_STYLE[1],
	UI_BORDER_STYLE[3],
	UI_BORDER_STYLE[5],
	UI_BORDER_STYLE[7]
}

telescope.setup({
	defaults = {
		layout_strategy = TELESCOPE_LAYOUT_STRATEGY,
		initial_mode = INITIAL_MODE,
		sorting_strategy = TELESCOPE_SORTING_STRATEGY,
		layout_config = {
			horizontal = {
				height = UI_HEIGHT,
				preview_cutoff = TELESCOPE_UI_PREVIEW_CUTOFF,
				preview_width = TELESCOPE_UI_PREVIEW_WIDTH,
				prompt_position = TELESCOPE_PROMPT_POSITION,
				width = UI_WIDTH
			},
			vertical = {
				height = UI_HEIGHT,
				preview_cutoff = TELESCOPE_UI_PREVIEW_CUTOFF,
				preview_width = TELESCOPE_UI_PREVIEW_WIDTH,
				prompt_position = TELESCOPE_PROMPT_POSITION,
				width = UI_WIDTH
			}
		},
		winblend = UI_WINDOW_BLEND,
		prompt_prefix = TELESCOPE_PROMPT_PREFIX,
		selection_caret = TELESCOPE_SELECTION_CARET,
		border = true,
		borderchars = UI_BORDER_STYLE,
		path_display = { "absolute" },
		results_title = TELESCOPE_RESULTS_TITLE,
		prompt_title = TELESCOPE_PROMPT_TITLE,
		file_ignore_patterns = {
			"%-lock"
		},
		mappings = {
			n = {
				[ "<esc>" ] = actions.close,
				[ "<cr>" ] = actions.select_default,
				[ "<tab>" ] = actions.toggle_selection + actions.move_selection_worse,
				[ "<s-tab>" ] = actions.toggle_selection + actions.move_selection_better,

				[ BUFLEADER .. "foh" ] = function(prompt_bufnr) vim.cmd("set nosplitright")
					actions.select_vertical(prompt_bufnr) end,

				[ BUFLEADER .. "foj" ] = function(prompt_bufnr) vim.cmd("set splitbelow")
					actions.select_horizontal(prompt_bufnr) end,

				[ BUFLEADER .. "fok" ] = function(prompt_bufnr) vim.cmd("set nosplitbelow")
					actions.select_horizontal(prompt_bufnr) end,

				[ BUFLEADER .. "fol" ] = function(prompt_bufnr) vim.cmd("set splitright")
					actions.select_vertical(prompt_bufnr) end,

				[ BUFLEADER .. "fot" ] = actions.select_tab,

				[ BUFLEADER .."<tab>" ] = actions.toggle_selection + actions.move_selection_worse,
				[ BUFLEADER .."<s-tab>" ] = actions.toggle_selection + actions.move_selection_better,
				[ BUFLEADER ..	"aa" ] = actions.send_to_qflist + actions.open_qflist,
				[ BUFLEADER ..	"as" ] = actions.send_selected_to_qflist + actions.open_qflist,

				[ "j" ] = actions.move_selection_next,
				[ "k" ] = actions.move_selection_previous,
				[ "H" ] = actions.move_to_top,
				[ "M" ] = actions.move_to_middle,
				[ "L" ] = actions.move_to_bottom,
				[ "gg" ] = actions.move_to_top,
				[ "G" ] = actions.move_to_bottom,
				[ "<c-u>" ] = actions.preview_scrolling_up,
				[ "<c-d>" ] = actions.preview_scrolling_down,
				[ "<c-b>" ] = actions.preview_scrolling_up,
				[ "<c-f>" ] = actions.preview_scrolling_down,
			},
			i = {
				[ "<cr>" ] = actions.select_default,
				[ "<c-j>" ] = actions.move_selection_next,
				[ "<c-k>" ] = actions.move_selection_previous,
			}
		}
	},
	extensions = {
		["ui-select"] = {
			themes.get_dropdown({})
		}
	}
})

-- load other extensions
telescope.load_extension("undo")
telescope.load_extension("ui-select")

