local k = "<leader><leader>k"
local l = "<leader><leader>l"
local m = "<leader><leader>m"
local n = "<leader><leader>n"
local o = "<leader><leader>o"

local K = "<leader><leader>K"
local L = "<leader><leader>L"
local M = "<leader><leader>M"
local N = "<leader><leader>N"
local O = "<leader><leader>O"

require("which-key").add({
	{ O, group = "Options" },
	{ O .. "l", group = "Line" },
	{ O .. "lw", "<cmd> set wrap! <cr>", desc = "Wrap" },
	{ O .. "ln", group = "Number" },
	{ O .. "lnn", "<cmd>set number!<cr>", desc = "Absolute" },
	{ O .. "lnr", "<cmd>set relativenumber!<cr>", desc = "Relative" },

	{ O .. "c", group = "Cursor" },
	{ O .. "ch", group = "Highlight" },
	{ O .. "chl", "<cmd> set cursorline! <cr>", desc = "Line" },
	{ O .. "chc", "<cmd> set cursorcolumn! <cr>", desc = "Column" },

	{ O .. "cs", group = "Scrolloff" },
	{
		O .. "csx",
		function()
			local before_scrolloff = vim.o.scrolloff
			if vim.o.scrolloff == 999 then
				vim.o.scrolloff = before_scrolloff
			else
				vim.o.scrolloff = 999
			end
		end,
		desc = "Middle line",
	},
	{
		O .. "csy",
		function()
			local before_sidescrolloff = vim.o.sidescrolloff
			if vim.o.sidescrolloff == 999 then
				vim.o.sidescrolloff = before_sidescrolloff
			else
				vim.o.sidescrolloff = 999
			end
		end,
		desc = "Middle Column",
	},
})

