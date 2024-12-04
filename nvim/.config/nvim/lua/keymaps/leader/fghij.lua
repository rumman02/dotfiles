local f = "<leader>f"
local g = "<leader>g"
local h = "<leader>h"
local i = "<leader>i"
local j = "<leader>j"

local F = "<leader>F"
local G = "<leader>G"
local H = "<leader>H"
local I = "<leader>I"
local J = "<leader>J"

require("which-key").add({
	{ g, group = "Git" },

	{ g .. "n", "<cmd>Gitsigns next_hunk<cr>", desc = "Next" },
	{ g .. "p", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous" },

	{ g .. "a", group = "Add(Stage)" },
	{ g .. "ab", "<cmd>Gitsigns stage_buffer<cr>", desc = "Buffer" },
	{ g .. "ah", "<cmd>Gitsigns stage_hunk<cr>", desc = "Hunk" },

	{ g .. "u", group = "Undo" },
	{ g .. "uh", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Hunk" },

	{ g .. "h", group = "Hunk" },
	{ g .. "hp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview inline" },
	{ g .. "hP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview" },
	{ g .. "hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset" },
	{ g .. "hs", "<cmd>Gitsigns select_hunk<cr>", desc = "Select" },
	{ g .. "hg", "<cmd>Gitsigns get_hunks<cr>", desc = "Get" },
	{ g .. "hv", "<cmd>Gitsigns nav_hunk<cr>", desc = "Navigate" },

	{ g .. "d", group = "Diff" },
	{ g .. "dw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Word" },
	{ g .. "da", "<cmd>Gitsigns diffthis<cr>", desc = "All" },

	{ g .. "b", group = "Blame" },
	{ g .. "bc", "<cmd>Gitsigns blame_line<cr>", desc = "Current line" },
	{ g .. "be", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Every line" },
	{ g .. "bs", "<cmd>Gitsigns blame<cr>", desc = "Split view" },

	{ g .. "t", group = "Toggle" },
	{ g .. "ts", "<cmd>Gitsigns toggle_signs<cr>", desc = "Signs" },
	{ g .. "tl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Line highlight" },
	{ g .. "tn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Number highlight" },
	{ g .. "td", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Delete highlight" },

	{ g .. "s", "<cmd>Gitsigns show<cr>", desc = "Show" },
	{ g .. "r", "<cmd>Gitsigns refresh <cr>", desc = "Refresh" },
	{ g .. "g", "<cmd>Gitsigns get_actions<cr>", desc = "Get actions" },

	{ g .. "B", group = "Base" },
	{ g .. "Bc", "<cmd>Gitsigns change_base<cr>", desc = "Change" },
	{ g .. "Br", "<cmd>Gitsigns reset_base<cr>", desc = "Reset" },

	{ g .. "R", group = "Reset" },
	{ g .. "Ri", "<cmd>Gitsigns reset_buffer_index<cr>", desc = "" },
	{ g .. "Rb", "<cmd>Gitsigns reset_buffer<cr>", desc = "" },

	{ g .. "l", group = "List" },
	{ g .. "ll", "<cmd>Gitsigns setloclist<cr>", desc = "Loclist" },
	{ g .. "lq", "<cmd>Gitsigns setqflist<cr>", desc = "Qflist" },
})

