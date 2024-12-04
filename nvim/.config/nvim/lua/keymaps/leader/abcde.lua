local a = "<leader>a"
local b = "<leader>b"
local c = "<leader>c"
local d = "<leader>d"
local e = "<leader>e"

local A = "<leader>A"
local B = "<leader>B"
local C = "<leader>C"
local D = "<leader>D"
local E = "<leader>E"

require("which-key").add({
	{ b,  group = "Bufferline" },
	{ b .. "p", "<cmd>BufferLinePick<cr>", desc = "Pick" },
	{ b .. "P", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
	{ b .. "m", group = "Move" },
	{ b .. "mh", "<cmd>BufferLineMovePrev<cr>", desc = "Right" },
	{ b .. "ml", "<cmd>BufferLineMoveNext<cr>", desc = "Left" },
	{ b .. "x", group = "Close" },
	{ b .. "xh", "<cmd>BufferLineCloseLeft<cr>", desc = "Left all" },
	{ b .. "xl", "<cmd>BufferLineCloseRight<cr>", desc = "Right all" },
	{ b .. "xp", "<cmd>BufferLinePickClose<cr>", desc = "Pick" },
	{ b .. "xc", "<cmd>bdelete<cr>", desc = "Current" },
	{ b .. "xo", "<cmd>BufferLineCloseOthers<cr>", desc = "Others" },
	{ b .. "s", group = "Sort" },
	{ b .. "st", "<cmd>BufferLineSortByTabs<cr>", desc = "Tab" },
	{ b .. "sd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Directory" },
	{ b .. "sr", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "Relative directory" },
	{ b .. "se", "<cmd>BufferLineSortByExtension<cr>", desc = "Extension" },
	{ b .. "g", group = "Group" },
	{ b .. "gt", "<cmd>BufferLineGroupToggle<cr>", desc = "Toggle" },
	{ b .. "gx", "<cmd>BufferLineGroupClose<cr>", desc = "Close" },
	{ b .. "1", "<cmd>BufferLineGoToBuffer 1<cr>", hidden = true },
	{ b .. "2", "<cmd>BufferLineGoToBuffer 2<cr>", hidden = true },
	{ b .. "3", "<cmd>BufferLineGoToBuffer 3<cr>", hidden = true },
	{ b .. "4", "<cmd>BufferLineGoToBuffer 4<cr>", hidden = true },
	{ b .. "5", "<cmd>BufferLineGoToBuffer 5<cr>", hidden = true },
	{ b .. "6", "<cmd>BufferLineGoToBuffer 6<cr>", hidden = true },
	{ b .. "7", "<cmd>BufferLineGoToBuffer 7<cr>", hidden = true },
	{ b .. "8", "<cmd>BufferLineGoToBuffer 8<cr>", hidden = true },
	{ b .. "9", "<cmd>BufferLineGoToBuffer 9<cr>", hidden = true },
	{ b .. "0", "<cmd>BufferLineGoToBuffer 10<cr>", hidden = true },

	{ e ,  group = "Explorer" },
	{ e .. "h", "<cmd>Neotree left<cr>", desc = "Left" },
	{ e .. "j", "<cmd>Neotree bottom<cr>", desc = "Down" },
	{ e .. "k", "<cmd>Neotree top<cr>", desc = "Up" },
	{ e .. "l", "<cmd>Neotree right<cr>", desc = "Right" },
	{ e .. "f", "<cmd>Neotree focus float<cr>", desc = "Float" },
	{ e .. "c", "<cmd>Neotree reveal<cr>", desc = "Current" },
	{ e .. "x", "<cmd>Neotree close<cr>", desc = "Close" },
	{ e .. "e", "<cmd>Neotree close<cr><cmd>Neotree focus<cr>", desc = "Focus" },
})

