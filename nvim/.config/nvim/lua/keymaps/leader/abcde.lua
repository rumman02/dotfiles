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
	{ b, group = "Bufferline" },

	{ b .. "p", "<cmd>BufferLinePick<cr>", desc = "Pick" },
	{ b .. "P", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },

	{ b .. "m", group = "Move" },
	{ b .. "mh", "<cmd>BufferLineMovePrev<cr>", desc = "Right" },
	{ b .. "ml", "<cmd>BufferLineMoveNext<cr>", desc = "Left" },
	{ b .. "mt", "<cmd>ScopeMoveBuf %d<cr>", desc = "Tab" },

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

	{ e, group = "Explorer" },
	{ e .. "e", "<cmd>Neotree close<cr><cmd>Neotree focus<cr>", desc = "Focus" },
	{ e .. "k", "<cmd>Neotree top<cr>", desc = "Up" },
	{ e .. "l", "<cmd>Neotree right<cr>", desc = "Right" },
	{ e .. "j", "<cmd>Neotree bottom<cr>", desc = "Down" },
	{ e .. "h", "<cmd>Neotree left<cr>", desc = "Left" },
	{ e .. "f", "<cmd>Neotree focus float<cr>", desc = "Float" },
	{
		e .. "x",
		function()
			vim.cmd("Neotree close")
			vim.cmd("Neotree close filesystem")
			vim.cmd("Neotree close buffers")
			vim.cmd("Neotree close git_status")
		end,
		desc = "Close",
	},

	{ e .. "c", group = "Current/Toggle" },
	{ e .. "cc", "<cmd>Neotree reveal<cr>", desc = "Current only" },
	{
		e .. "ca",
		function()
			local neo_tree = require("neo-tree")
			local config = neo_tree.config or {}

			-- Ensure filesystem table exists
			config.filesystem = config.filesystem or {}

			-- Toggle the setting
			local current_setting = config.filesystem.follow_current_file
				and config.filesystem.follow_current_file.enabled

			config.filesystem.follow_current_file = {
				enabled = not current_setting,
				leave_dirs_open = false,
			}

			-- Reapply the updated configuration
			neo_tree.setup(config)

			-- Notify the user
			vim.notify(
				"Neotree: Follow current file: " .. (not current_setting and "Enabled" or "Disabled"),
				vim.log.levels.INFO
			)
			vim.cmd("Neotree close")
			vim.cmd("Neotree")
		end,
		desc = "Toggle always (Leave files closed)",
	},
	{
		e .. "cA",
		function()
			local neo_tree = require("neo-tree")
			local config = neo_tree.config or {}

			-- Ensure filesystem table exists
			config.filesystem = config.filesystem or {}

			-- Toggle the setting
			local current_setting = config.filesystem.follow_current_file
				and config.filesystem.follow_current_file.enabled

			config.filesystem.follow_current_file = {
				enabled = not current_setting,
				leave_dirs_open = true,
			}

			-- Reapply the updated configuration
			neo_tree.setup(config)

			-- Notify the user
			vim.notify(
				"Neotree: Follow current file: " .. (not current_setting and "Enabled" or "Disabled"),
				vim.log.levels.INFO
			)
			vim.cmd("Neotree close")
			vim.cmd("Neotree")
		end,
		desc = "Toggle always (Leave files opened)",
	},
})

