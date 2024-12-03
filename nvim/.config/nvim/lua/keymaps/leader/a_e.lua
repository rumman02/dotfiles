local a = "<leader>a"
local b = "<leader>b"
local c = "<leader>c"
local d = "<leader>d"
local e = "<leader>e"

require("which-key").add({
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

