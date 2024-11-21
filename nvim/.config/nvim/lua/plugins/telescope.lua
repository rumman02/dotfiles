return {
	"nvim-telescope/telescope.nvim",
	cmd =  { "Telescope" },
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
	},
	opts = function ()
		local telescope = REQUIRE("telescope")
		local actions = REQUIRE("telescope.actions")

		-- load other extensions
		telescope.load_extension("undo")

		return {
			defaults = {
				layout_strategy = TELESCOPE_LAYOUT_STRATEGY,
				initial_mode = TELESCOPE_INITIAL_MODE,
				sorting_strategy = TELESCOPE_SORTING_STRATEGY,
				layout_config = {
					horizontal = {
						height = TELESCOPE_UI_HORIZONTAL_HEIGHT,
						preview_cutoff = TELESCOPE_UI_HORIZONTAL_PREVIEW_CUTOFF,
						preview_width = TELESCOPE_UI_HORIZONTAL_PREVIEW_WIDTH,
						prompt_position = TELESCOPE_UI_HORIZONTAL_PROMPT_POSITION,
						width = TELESCOPE_UI_HORIZONTAL_WIDTH
					},
					vertical = {
						height = TELESCOPE_UI_VERTICAL_HEIGHT,
						preview_cutoff = TELESCOPE_UI_VERTICAL_PREVIEW_CUTOFF,
						preview_width = TELESCOPE_UI_VERTICAL_PREVIEW_WIDTH,
						prompt_position = TELESCOPE_UI_VERTICAL_PROMPT_POSITION,
						width = TELESCOPE_UI_VERTICAL_WIDTH
					}
				},
				winblend = TELESCOPE_UI_WINDOW_BLEND,
				prompt_prefix = TELESCOPE_PROMPT_PREFIX,
				selection_caret = TELESCOPE_SELECTION_CARET,
				border = true,
				borderchars = TELESCOPE_UI_BORDER_STYLE,
				path_display = TELESCOPE_PATH_DISPLAY,
				results_title = TELESCOPE_RESULTS_TITLE,
				prompt_title = TELESCOPE_PROMPT_TITLE,
				file_ignore_patterns = {
					"%-lock"
				},
				mappings = {
					n = {
						["<esc>"] = actions.close,
						["<cr>"] = actions.select_default,
						["<tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<s-tab>"] = actions.toggle_selection + actions.move_selection_better,

						[BUFLEADER .. "foh"] = function(prompt_bufnr) vim.cmd("set nosplitright") actions.select_vertical(prompt_bufnr) end,
						[BUFLEADER .. "foj"] = function(prompt_bufnr) vim.cmd("set splitbelow") actions.select_horizontal(prompt_bufnr) end,
						[BUFLEADER .. "fok"] = function(prompt_bufnr) vim.cmd("set nosplitbelow") actions.select_horizontal(prompt_bufnr) end,
						[BUFLEADER .. "fol"] = function(prompt_bufnr) vim.cmd("set splitright") actions.select_vertical(prompt_bufnr) end,
						[BUFLEADER .. "fot"] = actions.select_tab,

						[BUFLEADER .."<tab>"] = actions.toggle_selection + actions.move_selection_worse,
						[BUFLEADER .."<s-tab>"] = actions.toggle_selection + actions.move_selection_better,
						[BUFLEADER ..	"aa"] = actions.send_to_qflist + actions.open_qflist,
						[BUFLEADER ..	"as"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<c-u>"] = actions.preview_scrolling_up,
						["<c-d>"] = actions.preview_scrolling_down,
						["<c-b>"] = actions.preview_scrolling_up,
						["<c-f>"] = actions.preview_scrolling_down,
					},
					i = {
						["<cr>"] = actions.select_default,
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
					}
				}
			}
		}
	end
}

