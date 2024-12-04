local p = "<leader><leader>p"
local q = "<leader><leader>q"
local r = "<leader><leader>r"
local s = "<leader><leader>s"
local t = "<leader><leader>t"

local P = "<leader><leader>P"
local Q = "<leader><leader>Q"
local R = "<leader><leader>R"
local S = "<leader><leader>S"
local T = "<leader><leader>T"

require("which-key").add({
	{ S, group = "Session" },
	{ S .. "r", "<cmd>SessionRestore<cr>", desc = "Restore" },
	{ S .. "s", "<cmd>SessionSave<cr>", desc = "Save" },
	{ S .. "S", "<cmd>Telescope session-lens<cr>", desc = "Search" },
	{ S .. "n", group = "Named" },
	{ S .. "nr", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("SessionRestore " .. char)
		else
			vim.notify("No name inserted")
		end
	end, desc = "Restore" },
	{ S .. "ns", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("SessionSave " .. char)
		else
			vim.notify("No name inserted")
		end
	end, desc = "Save" },
})

