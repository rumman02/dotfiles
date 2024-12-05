local p = "<leader>p"
local q = "<leader>q"
local r = "<leader>r"
local s = "<leader>s"
local t = "<leader>t"

local P = "<leader>P"
local Q = "<leader>Q"
local R = "<leader>R"
local S = "<leader>S"
local T = "<leader>T"

require("which-key").add({
	{ s, group = "Search" },
	{ s .. "h", "<cmd>Telescope search_history<cr>", desc = "Search history" },
	{ s .. "x", "<cmd> nohlsearch <cr>", desc = "Clear search" },
	{ s .. "r", ":%s/", desc = "Replace" },
	{ s .. "r", ":s/", desc = "Replace", mode = { "v", "x" } },

	{ s .. "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump" },
	{ s .. "t", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Treesitter" },
	{ s .. "J", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	{ s .. "T", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	{ s .. "l", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "Line", mode = { "n", "x", "o" } },
	{ s .. "c", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Cursor", mode = { "n", "x", "o" } },
	{ s .. "w", function() require("flash").jump({ search = { mode = function(pattern) return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern) end, }, jump = { pos = "range" }, }) end, desc = "Word", mode = { "n", "x", "o" } },

	{ t, group = "Tabs" },
  { t .. "oo", "<cmd>tabnew<cr>", desc  = "Open" },
	{ t .. "on", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("tabnew")
			vim.cmd("BufferLineTabRename " .. char)
		else
			vim.notify("No name inserted")
		end
	end, desc = "Named" },

	{ t .. "r", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("BufferLineTabRename " .. char)
		else
			vim.notify("No name inserted")
		end
	end, desc = "Rename" },

  { t .. "x", "<cmd>tabclose<cr>", desc  = "Close" },
  { t .. "l", "<cmd>tabs<cr>", desc  = "List" }

})

