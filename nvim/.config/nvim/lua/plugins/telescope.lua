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
				layout_strategy = "flex", -- if enough space then horizontal layout else vertical layout
				initial_mode = "normal",
				sorting_strategy = "descending",
				layout_config = {
					horizontal = {
						height = 0.85,
						preview_cutoff = 40,
						preview_width = 0.40,
						prompt_position = "bottom",
						width = 0.70
					},
					vertical = {
						height = 0.70,
						preview_cutoff = 40,
						preview_width = 0.40,
						prompt_position = "bottom",
						width = 0.70
					}
				},
				winblend = 5,
				prompt_prefix = "",
				selection_caret = " ",
				border = true,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				path_display = { "absolute" },
				results_title = "Results",
				prompt_title = "",
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

