local u = "<leader>u"
local v = "<leader>v"
local w = "<leader>w"
local x = "<leader>x"
local y = "<leader>y"
local z = "<leader>z"

local U = "<leader>U"
local V = "<leader>V"
local W = "<leader>W"
local X = "<leader>X"
local Y = "<leader>Y"
local Z = "<leader>Z"

require("which-key").add({
	{ w, group = "Window" },
	{ w .. "o", desc = "Open" },
	{ w .. "oj", "<cmd> set nosplitbelow <Bar> split <cr>", desc = "Open down" },
	{ w .. "ok", "<cmd> set splitbelow <Bar> split <cr>", desc = "Open up" },
	{ w .. "oh", "<cmd> set splitright <Bar> vsplit <cr>", desc = "Open left" },
	{ w .. "ol", "<cmd> set nosplitright <Bar> vsplit <cr>", desc = "Open right" },
	{ w .. "ot", "<c-w>T", desc = "Open as tab" },
	{ w .. "x", desc = "Close" },
	{ w .. "xc", "<c-w>c", desc = "Current" },
	{ w .. "xh", "<c-w>h<c-w>c", desc = "Left" },
	{ w .. "xj", "<c-w>j<c-w>c", desc = "Down" },
	{ w .. "xk", "<c-w>k<c-w>c", desc = "Up" },
	{ w .. "xl", "<c-w>l<c-w>c", desc = "Right" },
	{ w .. "xo", "<c-w>o", desc = "Others" },
	{ w .. "M", desc = "Move" },
	{ w .. "Mj", "<cmd>wincmd J<cr>", desc = "Move most bottom" },
	{ w .. "Mk", "<cmd>wincmd K<cr>", desc = "Move most top" },
	{ w .. "Mh", "<cmd>wincmd H<cr>", desc = "Move most left" },
	{ w .. "Ml", "<cmd>wincmd L<cr>", desc = "Move most right" },
	{ w .. "s", desc = "Swap" },
	{ w .. "sh", "<cmd>SmartSwapLeft<cr>", desc = "Left" },
	{ w .. "sj", "<cmd>SmartSwapDown<cr>", desc = "Down" },
	{ w .. "sk", "<cmd>SmartSwapUp<cr>", desc = "Up" },
	{ w .. "sl", "<cmd>SmartSwapRight<cr>", desc = "Right" },
	{ w .. "ss", "<c-w>r", desc = "Swap" },
	{ w .. "sr", "<c-w>R", desc = "Swap reverse" },
	{ w .. "t", "<cmd>WindowsToggleAutowidth<cr>", desc = "Toggle auto expand" },
	{ w .. "m", "<cmd>WindowsMaximize<cr>", desc = "Maximize both" },
	{ w .. "x", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Maximize horizontal" },
	{ w .. "y", "<cmd>WindowsMaximizeVertically<cr>", desc = "Maximize vertical" },
	{ w .. "e", "<cmd>WindowsEqualize<cr>", desc = "Equal" },
	{
		w .. "r",
		function()
			require("smart-splits").start_resize_mode()
		end,
		desc = "Resize mode",
	},

	{ z, group = "Save/Quit" },
	{ z .. "z", "<cmd>write<cr>", desc = "Save current" },
	{ z .. "a", "<cmd>wall<cr>", desc = "Save all" },

	{ z .. "q", "<cmd>wq<cr>", desc = "Save & quit" },
	{ z .. "Q", "<cmd>wq<cr>", desc = "Save all & quit" },

	{ z .. "e", "<cmd>wq<cr>", desc = "Quit" },
	{ z .. "E", "<cmd>wq<cr>", desc = "Quit all" },
})

