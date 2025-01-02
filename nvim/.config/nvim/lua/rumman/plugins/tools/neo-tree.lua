---@diagnostic disable: duplicate-set-field
local neo_tree = require("neo-tree")

local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")
local neotree_local_leader = require("rumman.lib.keys").neotree.leaders.locals

neo_tree.setup({
	close_if_last_window = false,
	popup_border_style = {
		icons.ui.BorderTopLeft,
		icons.ui.BorderTop,
		icons.ui.BorderTopRight,
		icons.ui.BorderRight,
		icons.ui.BorderBottomRight,
		icons.ui.BorderBottom,
		icons.ui.BorderBottomLeft,
		icons.ui.BorderLeft,
	},
	source_selector = {
		winbar = true,
		sources = {
			{
				source = "filesystem",
				display_name = " " .. icons.documents.Files .. " Files "
			},
			{
				source = "buffers",
				display_name = " " .. icons.ui.Tab .. " Buffers "
			},
			{
				source = "git_status",
				display_name = icons.git.Branch .. " Git "
			},
		},
		content_layout = utils.ui.title_position,
		tabs_layout = "equal",
	},
	default_component_configs = {
		indent = {
			indent_size = utils.indent_size.explorer,
			indent_marker = icons.ui.BorderLeft,
			last_indent_marker = icons.ui.BorderBottomLeft .. icons.ui.BorderBottom,
		},
		icon = {
			folder_closed = icons.documents.Folder,
			folder_open = icons.documents.OpenFolder,
			folder_empty = icons.documents.OpenFolderEmpty,
		},
		modified = {
			symbol = icons.ui.Edited,
		},
		diagnostics = {
			symbols = {
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Information,
				warn = icons.diagnostics.Warning,
				error = icons.diagnostics.Error,
			},
		},
		name = {
			use_git_status_colors = false,
		},
		git_status = {
			symbols = {
				added = icons.git.Add,
				deleted = icons.git.Remove,
				modified = icons.git.Mod,
				renamed = icons.git.Rename,
				untracked = icons.git.Untrack,
				ignored = icons.git.Ignore,
				unstaged = icons.git.Unstage,
				staged = icons.git.Stage,
				conflict = icons.git.Conflict,
			},
		},
	},
	window = {
		position = "left",
		-- width = 40,
		mappings = {
			-- for easy access common keys
			["a"] = "add",
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["R"] = "refresh",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["i"] = "show_file_details",
			["<c-s-l>"] = "next_source",
			["<c-s-h>"] = "prev_source",

			-- disable some keymaps
			["c"] = "none",
			["f"] = "none",
			["e"] = "none",
			["j"] = "none",
			["k"] = "none",
			["m"] = "none",
			["o"] = "none",
			["oc"] = "none",
			["od"] = "none",
			["og"] = "none",
			["om"] = "none",
			["on"] = "none",
			["os"] = "none",
			["ot"] = "none",
			["s"] = "none",
			["t"] = "none",
			["w"] = "none",
			["z"] = "none",
			["P"] = "none",
			["C"] = "none",
			["D"] = "none",
			["H"] = "none",
			["S"] = "none",
			["[g"] = "none",
			["]g"] = "none",
			["q"] = "none",
			["#"] = "none",
			-- ["."] = "none",
			["?"] = "none",
			["<bs>"] = "none",
			["<space>"] = "none",
			["<2-leftmouse>"] = "none",

			-- remapping
			[neotree_local_leader .. "fpo"] = {
				"toggle_preview",
				desc = "Open",
				config = { use_float = false, use_image_nvim = true },
			},
			[neotree_local_leader .. "fpf"] = { "focus_preview", desc = "Focus" },

			[neotree_local_leader .. "foh"] = { "open_leftabove_vs", desc = "Left" },
			[neotree_local_leader .. "fol"] = { "open_vsplit", desc = "Right" },
			[neotree_local_leader .. "foj"] = { "open_split", desc = "Down" },

			[neotree_local_leader .. "fopc"] = { "open_with_window_picker", desc = "Current" },
			[neotree_local_leader .. "foph"] = { "split_with_window_picker", desc = "Horizontal" },
			[neotree_local_leader .. "fopv"] = { "vsplit_with_window_picker", desc = "Vertical" },

			[neotree_local_leader .. "fotn"] = { "open_tabnew", desc = "New" },
			[neotree_local_leader .. "fotd"] = { "open_tab_drop", desc = "Drop" },

			[neotree_local_leader .. "fd"] = { "delete", desc = "Delete" },
			[neotree_local_leader .. "fr"] = { "rename", desc = "Rename" },
			[neotree_local_leader .. "fa"] = { "add", desc = "Add" },
			[neotree_local_leader .. "da"] = { "add_directory", desc = "Add" },

			[neotree_local_leader .. "cc"] = { "close_node", desc = "Current node" },
			[neotree_local_leader .. "cs"] = { "close_all_subnodes", desc = "Sub & current nodes" },
			[neotree_local_leader .. "ca"] = { "close_all_nodes", desc = "All nodes" },
			[neotree_local_leader .. "e"] = { "expand_all_nodes", desc = "Expand all" },

			[neotree_local_leader .. "i"] = { "show_file_details", desc = "Show details" },
			[neotree_local_leader .. "R"] = { "refresh", desc = "Refresh" },
			[neotree_local_leader .. "p"] = { "paste_from_clipboard", desc = "Paste" },
			[neotree_local_leader .. "x"] = { "close_window", desc = "Quit" },
			[neotree_local_leader .. "C"] = { "cut_to_clipboard", desc = "Cut" },
			[neotree_local_leader .. "y"] = { "copy_to_clipboard", desc = "Copy" },
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true,
		},
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
		window = {
			mappings = {
				-- for easy access common keys
				["<"] = "navigate_up",
				[">"] = "set_root",
				["s"] = "fuzzy_finder",
				["e"] = "toggle_auto_expand_width",

				-- remapping
				[neotree_local_leader .. "<"] = { "navigate_up", desc = "Go back" },
				[neotree_local_leader .. ">"] = { "set_root", desc = "Go front" },
				[neotree_local_leader .. "h"] = { "toggle_hidden", desc = "Show hidden" },
				[neotree_local_leader .. "ff"] = { "fuzzy_finder", desc = "Find" }, -- fuzzy sorting using the fzy algorithm
				[neotree_local_leader .. "df"] = { "fuzzy_finder_directory", desc = "Find" },
				[neotree_local_leader .. "gp"] = { "prev_git_modified", desc = "Previous" },
				[neotree_local_leader .. "gn"] = { "next_git_modified", desc = "Next" },
				[neotree_local_leader .. "oc"] = { "order_by_created", desc = "Created" },
				[neotree_local_leader .. "od"] = { "order_by_diagnostics", desc = "Diagnostics" },
				[neotree_local_leader .. "og"] = { "order_by_git_status", desc = "Git status" },
				[neotree_local_leader .. "om"] = { "order_by_modified", desc = "Modified" },
				[neotree_local_leader .. "on"] = { "order_by_name", desc = "Name" },
				[neotree_local_leader .. "os"] = { "order_by_size", desc = "Size" },
				[neotree_local_leader .. "ot"] = { "order_by_type", desc = "Type" },
			},
			fuzzy_finder_mappings = {
				-- define keymaps for filter popup window in fuzzy_finder_mode
				["<c-n>"] = "move_cursor_down",
				["<c-p>"] = "move_cursor_up",
				["<c-j>"] = "move_cursor_down",
				["<c-k>"] = "move_cursor_up",
			},
		},
	},
	buffers = {
		window = {
			mappings = {
				-- for easy access common keys
				["<"] = "navigate_up",
				[">"] = "set_root",
				["d"] = "buffer_delete",

				-- remapping
				[neotree_local_leader .. "<"] = { "navigate_up", desc = "Go back" },
				[neotree_local_leader .. ">"] = { "set_root", desc = "Go front" },
				[neotree_local_leader .. "bd"] = { "buffer_delete", desc = "Delete" },
				[neotree_local_leader .. "bo"] = { function() end, desc = "Order", nowait = false },
				[neotree_local_leader .. "boc"] = { "order_by_created", desc = "Created" },
				[neotree_local_leader .. "bod"] = { "order_by_diagnostics", desc = "Diagnostics" },
				[neotree_local_leader .. "bog"] = { "order_by_git_status", desc = "Git status" },
				[neotree_local_leader .. "bom"] = { "order_by_modified", desc = "Modified" },
				[neotree_local_leader .. "bon"] = { "order_by_name", desc = "Name" },
				[neotree_local_leader .. "bos"] = { "order_by_size", desc = "Size" },
				[neotree_local_leader .. "bot"] = { "order_by_type", desc = "Type" },
			},
		},
	},
	git_status = {
		window = {
			mappings = {
				[neotree_local_leader .. "ga"] = { function() end, desc = "Add", nowait = false },
				[neotree_local_leader .. "gaa"] = { "git_add_all", desc = "All" },
				[neotree_local_leader .. "gac"] = { "git_add_file", desc = "Current" },
				[neotree_local_leader .. "gu"] = { "git_unstage_file", desc = "Unstage" },
				[neotree_local_leader .. "gr"] = { "git_revert_file", desc = "Revert" },
				[neotree_local_leader .. "gc"] = { "git_commit", desc = "Commit" },
				[neotree_local_leader .. "gp"] = { "git_push", desc = "Push" },
				[neotree_local_leader .. "gg"] = { "git_commit_and_push", desc = "Commit & push" },
				[neotree_local_leader .. "goc"] = { "order_by_created", desc = "Created" },
				[neotree_local_leader .. "god"] = { "order_by_diagnostics", desc = "Diagnostics" },
				[neotree_local_leader .. "gog"] = { "order_by_git_status", desc = "Git status" },
				[neotree_local_leader .. "gom"] = { "order_by_modified", desc = "Modified" },
				[neotree_local_leader .. "gon"] = { "order_by_name", desc = "Name" },
				[neotree_local_leader .. "gos"] = { "order_by_size", desc = "Size" },
				[neotree_local_leader .. "got"] = { "order_by_type", desc = "Type" },
			},
		},
	},
})

