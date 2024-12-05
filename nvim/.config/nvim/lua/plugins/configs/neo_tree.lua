local neo_tree = require("neo-tree")

neo_tree.setup({
	close_if_last_window = true,
	popup_border_style = UI_BORDER_STYLE,
	enable_git_status = true,
	enable_diagnostics = true,
	source_selector = {
		winbar = true,
		statusline = true,
		sources = {
			{ source = "filesystem", display_name = " Files " },
			{ source = "buffers", display_name = "󰓩 Buffers " },
			{ source = "git_status", display_name = " Git " },
		},
		content_layout = "center",
		tabs_layout = "equal"
	},
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = INDENT_SIZE,
			padding = 0,
			with_markers = true,
			indent_marker = INDENT_LINE_SYMBOL,
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander"
		},
		icon = {
			folder_closed = "󰉋 ",
			folder_open = "󰝰 ",
			folder_empty = "󰉖 ",
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = MODIFIED_SYMBOL_ICON,
			highlight = MODIFIED_SYMBOL_HIGHLIGHTS
		},
		diagnostics = {
			symbols = {
				hint = DIAGNOSTICS_SYMBOLS_HINT_ICON,
				info = DIAGNOSTICS_SYMBOLS_INFO_ICON,
				warn = DIAGNOSTICS_SYMBOLS_WARN_ICON,
				error = DIAGNOSTICS_SYMBOLS_ERROR_ICON
			},
			highlights = {
				hint = DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS,
				info = DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS,
				warn = DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS,
				error = DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS
			},
		},
		name = {
			use_git_status_colors = true,
			highlight = "NeoTreeFileName"
		},
		git_status = {
			symbols = {
				added = GIT_SYMBOLS_ADDED_ICON,
				modified = GIT_SYMBOLS_MODIFIED_ICON,
				deleted = GIT_SYMBOLS_DELETED_ICON,
				renamed = GIT_SYMBOLS_RENAMED_ICON,
				untracked = GIT_SYMBOLS_UNTRACKED_ICON,
				ignored = GIT_SYMBOLS_IGNORED_ICON,
				unstaged = GIT_SYMBOLS_UNSTAGED_ICON,
				staged = GIT_SYMBOLS_STAGED_ICON,
				conflict = GIT_SYMBOLS_CONFLICT_ICON
			}
		},
	},
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			-- for easy access common keys
			[ "a" ] = "add",
			[ "A" ] = "add_directory",
			[ "d" ] = "delete",
			[ "r" ] = "rename",
			[ "R" ] = "refresh",
			[ "y" ] = "copy_to_clipboard",
			[ "x" ] = "cut_to_clipboard",
			[ "p" ] = "paste_from_clipboard",
			[ "i" ] = "show_file_details",
			[ "<a-l>" ] = "next_source",
			[ "<a-h>" ] = "prev_source",

			-- disable some keymaps
			[ "c" ] = "none",
			[ "f" ] = "none",
			[ "e" ] = "none",
			[ "j" ] = "none",
			[ "k" ] = "none",
			[ "m" ] = "none",
			[ "o" ] = "none",
			[ "oc" ] = "none",
			[ "od" ] = "none",
			[ "og" ] = "none",
			[ "om" ] = "none",
			[ "on" ] = "none",
			[ "os" ] = "none",
			[ "ot" ] = "none",
			[ "s" ] = "none",
			[ "t" ] = "none",
			[ "w" ] = "none",
			[ "z" ] = "none",
			[ "P" ] = "none",
			[ "C" ] = "none",
			[ "D" ] = "none",
			[ "H" ] = "none",
			[ "S" ] = "none",
			[ "[g" ] = "none",
			[ "]g" ] = "none",
			[ "<space>" ] = "none",
			[ "<esc>" ] = "none",
			[ "q" ] = "none",
			[ "<bs>" ] = "none",
			[ "<2-leftmouse>" ] = "none",
			[ "#" ] = "none",
			[ "." ] = "none",
			[ "?" ] = "none",

			-- remapping 
			[ BUFLEADER .. "fpo" ] = { "toggle_preview", desc = "Open", config = { use_float = true, use_image_nvim = true } },
			[ BUFLEADER .. "fpf" ] = { "focus_preview", desc = "Focus" },

			[ BUFLEADER .. "foh" ] = { "open_leftabove_vs", desc = "Left" },
			[ BUFLEADER .. "fol" ] = { "open_vsplit", desc = "Right" },
			[ BUFLEADER .. "foj" ] = { "open_split", desc = "Down" },

			[ BUFLEADER .. "fopc" ] = { "open_with_window_picker", desc = "Current" },
			[ BUFLEADER .. "foph" ] = { "split_with_window_picker", desc = "Horizontal" },
			[ BUFLEADER .. "fopv" ] = { "vsplit_with_window_picker", desc = "Vertical" },

			[ BUFLEADER .. "fotn" ] = { "open_tabnew", desc = "New" },
			[ BUFLEADER .. "fotd" ] = { "open_tab_drop", desc = "Drop" },

			[ BUFLEADER .. "fd" ] = { "delete", desc = "Delete" },
			[ BUFLEADER .. "fr" ] = { "rename", desc = "Rename" },
			[ BUFLEADER .. "fa" ] = { "add", desc = "Add" },
			[ BUFLEADER .. "da" ] = { "add_directory", desc = "Add" },

			[ BUFLEADER .. "cc" ] = { "close_node", desc = "Current node" },
			[ BUFLEADER .. "cs" ] = { "close_all_subnodes", desc = "Sub & current nodes" },
			[ BUFLEADER .. "ca" ] = { "close_all_nodes", desc = "All nodes" },
			[ BUFLEADER .. "ea" ] = { "expand_all_nodes", desc = "All nodes" },

			[ BUFLEADER .. "i" ] = { "show_file_details", desc = "Show details" },
			[ BUFLEADER .. "r" ] = { "refresh", desc = "Refresh" },
			[ BUFLEADER .. "p" ] = { "paste_from_clipboard", desc = "Paste" },
			[ BUFLEADER .. "<esc>" ] = { "close_window",desc = "Quit" },
			[ BUFLEADER .. "x" ] = { "cut_to_clipboard", desc = "Cut" },
			[ BUFLEADER .. "y" ] = { "copy_to_clipboard", desc = "Copy" },
		}
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
			hide_by_name = {
				".git",
				"node_modules"
			},
			hide_by_pattern = {},
			always_show = {},
			always_show_by_pattern = {},
			never_show = {},
			never_show_by_pattern = {}
		},
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
		window = {
			mappings = {
				-- for easy access common keys
				["<"] = "navigate_up",
				[">"] = "set_root",
				["s"] = "fuzzy_finder",

				-- remapping 
				[ BUFLEADER .. "<" ] = { "navigate_up", desc = "Go back" },
				[ BUFLEADER .. ">" ] = { "set_root", desc = "Go front" },
				[ BUFLEADER .. "h" ] = { "toggle_hidden", desc = "Show hidden" },
				[ BUFLEADER .. "ff" ] = { "fuzzy_finder", desc = "Find" }, -- fuzzy sorting using the fzy algorithm
				[ BUFLEADER .. "df" ] = { "fuzzy_finder_directory", desc = "Find" },
				[ BUFLEADER .. "gmp" ] = { "prev_git_modified", desc = "Previous" },
				[ BUFLEADER .. "gmn" ] = { "next_git_modified", desc = "Next" },
				[ BUFLEADER .. "oc" ] = { "order_by_created", desc = "Created" },
				[ BUFLEADER .. "od" ] = { "order_by_diagnostics", desc = "Diagnostics" },
				[ BUFLEADER .. "og" ] = { "order_by_git_status", desc = "Git status" },
				[ BUFLEADER .. "om" ] = { "order_by_modified", desc = "Modified" },
				[ BUFLEADER .. "on" ] = { "order_by_name", desc = "Name" },
				[ BUFLEADER .. "os" ] = { "order_by_size", desc = "Size" },
				[ BUFLEADER .. "ot" ] = { "order_by_type", desc = "Type" },
			},
			fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				[ "<c-n>" ] = "move_cursor_down",
				[ "<c-p>" ] = "move_cursor_up",
				[ "<c-j>" ] = "move_cursor_down",
				[ "<c-k>" ] = "move_cursor_up",
			},
		},
		commands = {}
	},
	buffers = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			mappings = {
				-- for easy access common keys
				[ "<" ] = "navigate_up",
				[ ">" ] = "set_root",
				[ "d" ] = "buffer_delete",

				-- remapping 
				[ BUFLEADER .. "<" ] = { "navigate_up", desc = "Go back" },
				[ BUFLEADER .. ">" ] = { "set_root", desc = "Go front" },
				[ BUFLEADER .. "bd" ] = { "buffer_delete", desc = "Delete" },
				[ BUFLEADER .. "bo" ] = { function() end, desc = "Order", nowait = false },
				[ BUFLEADER .. "boc" ] = { "order_by_created", desc = "Created" },
				[ BUFLEADER .. "bod" ] = { "order_by_diagnostics", desc = "Diagnostics" },
				[ BUFLEADER .. "bog" ] = { "order_by_git_status", desc = "Git status" },
				[ BUFLEADER .. "bom" ] = { "order_by_modified", desc = "Modified" },
				[ BUFLEADER .. "bon" ] = { "order_by_name", desc = "Name" },
				[ BUFLEADER .. "bos" ] = { "order_by_size", desc = "Size" },
				[ BUFLEADER .. "bot" ] = { "order_by_type", desc = "Type" },
			}
		}
	},
	git_status = {
		window = {
			mappings = {
				[ BUFLEADER .. "ga" ] = { function() end, desc = "Add", nowait = false },
				[ BUFLEADER .. "gaa" ] = { "git_add_all", desc = "All" },
				[ BUFLEADER .. "gac" ] = { "git_add_file", desc = "Current" },
				[ BUFLEADER .. "gu" ] = { "git_unstage_file", desc = "Unstage" },
				[ BUFLEADER .. "gr" ] = { "git_revert_file", desc = "Revert" },
				[ BUFLEADER .. "gc" ] = { "git_commit", desc = "Commit" },
				[ BUFLEADER .. "gp" ] = { "git_push", desc = "Push" },
				[ BUFLEADER .. "gg" ] = { "git_commit_and_push", desc = "Commit & push" },
				[ BUFLEADER .. "goc" ] = { "order_by_created", desc = "Created" },
				[ BUFLEADER .. "god" ] = { "order_by_diagnostics", desc = "Diagnostics" },
				[ BUFLEADER .. "gog" ] = { "order_by_git_status", desc = "Git status" },
				[ BUFLEADER .. "gom" ] = { "order_by_modified", desc = "Modified" },
				[ BUFLEADER .. "gon" ] = { "order_by_name", desc = "Name" },
				[ BUFLEADER .. "gos" ] = { "order_by_size", desc = "Size" },
				[ BUFLEADER .. "got" ] = { "order_by_type", desc = "Type" },
			}
		}
	}
})

