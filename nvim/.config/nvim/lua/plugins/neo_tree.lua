-- neo-tree configuration =========================================================
-- https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#quickstart
-- ================================================================================

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = { "Neotree" },
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neo_tree = REQUIRE("neo-tree")
		neo_tree.setup({
			close_if_last_window = true,
			popup_border_style = NEOTREE_POPUP_BORDER_STYLE,
			enable_git_status = NEOTREE_GIT_SYMBOLS_ENABLE,
			enable_diagnostics = NEOTREE_DIAGNOSTICS_ENABLE,
			source_selector = {
				winbar = NEOTREE_SOURCE_SELECTOR_WINBAR,
				statusline = NEOTREE_SOURCE_SELECTOR_STATUSLINE,
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
					enable_character_fade = NEOTREE_CHARACTER_FADE_ENABLE
				},
				indent = {
					indent_size = NEOTREE_INDENT_SIZE,
					padding = NEOTREE_INDENT_PADDING,
					with_markers = true,
					indent_marker = NEOTREE_INDENT_SYMBOLS_LINE_ICON,
					last_indent_marker = NEOTREE_INDENT_SYMBOLS_LAST_LINE_ICON,
					highlight = NEOTREE_INDENT_SYMBOLS_LAST_LINE,
					with_expanders = true,
					expander_collapsed = NEOTREE_EXPANDER_SYMBOLS_COLLAPSED_ICON,
					expander_expanded = NEOTREE_EXPANDER_SYMBOLS_EXPANDED_ICON,
					expander_highlight = NEOTREE_EXPANDER_SYMBOLS_HIGHLIGHTS
				},
				icon = {
					folder_closed = NEOTREE_FOLDER_SYMBOLS_CLOSED_ICON,
					folder_open = NEOTREE_FOLDER_SYMBOLS_OPEN_ICON,
					folder_empty = NEOTREE_FOLDER_SYMBOLS_EMPTY_ICON,
					default = "*",
					highlight = NEOTREE_FOLDER_SYMBOLS_HIGHLIGHTS
				},
				modified = {
					symbol = NEOTREE_MODIFIED_SYMBOL_ICON,
					highlight = NEOTREE_MODIFIED_SYMBOL_HIGHLIGHTS
				},
				diagnostics = {
					symbols = {
						hint = NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_ICON,
						info = NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_ICON,
						warn = NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_ICON,
						error = NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_ICON
					},
					highlights = {
						hint = NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS,
						info = NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS,
						warn = NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS,
						error = NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS
					},
				},
				name = {
					use_git_status_colors = NEOTREE_GIT_SYMBOLS_COLORS_ENABLE,
					highlight = NEOTREE_GIT_SYMBOLS_HIGHLIGHTS
				},
				git_status = {
					symbols = {
						added = NEOTREE_GIT_SYMBOLS_ADDED_ICON,
						modified = NEOTREE_GIT_SYMBOLS_MODIFIED_ICON,
						deleted = NEOTREE_GIT_SYMBOLS_DELETED_ICON,
						renamed = NEOTREE_GIT_SYMBOLS_RENAMED_ICON,
						untracked = NEOTREE_GIT_SYMBOLS_UNTRACKED_ICON,
						ignored = NEOTREE_GIT_SYMBOLS_IGNORED_ICON,
						unstaged = NEOTREE_GIT_SYMBOLS_UNSTAGED_ICON,
						staged = NEOTREE_GIT_SYMBOLS_STAGED_ICON,
						conflict = NEOTREE_GIT_SYMBOLS_CONFLICT_ICON
					}
				},
			},
			window = {
				position = NEOTREE_DEFAULT_POSITION,
				width = NEOTREE_DEFAULT_WINDOW_SIZE,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
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
					["<esc>"] = "close_window",
					["i"] = "show_file_details",
					["<a-l>"] = "next_source",
					["<a-h>"] = "prev_source",

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
					-- ["s"] = "none",
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
					["<space>"] = "none",
					-- ["<esc>"] = "none",
					["q"] = "none",
					["<bs>"] = "none",
					["<2-leftmouse>"] = "none",
					["#"] = "none",
					["."] = "none",
					["?"] = "none",

					-- remapping 
					[ BUFLEADER .. "fpo"] = {"toggle_preview", desc = "Open", config = {use_float = true, use_image_nvim = true}},
					[ BUFLEADER .. "fpf"] = {"focus_preview", desc = "Focus"},

					[ BUFLEADER .. "foh"] = {"open_leftabove_vs", desc = "Left"},
					[ BUFLEADER .. "fol"] = {"open_vsplit", desc = "Right"},
					[ BUFLEADER .. "foj"] = {"open_split", desc = "Down"},

					[ BUFLEADER .. "fopc"] = {"open_with_window_picker", desc = "Current"},
					[ BUFLEADER .. "foph"] = {"split_with_window_picker", desc = "Horizontal"},
					[ BUFLEADER .. "fopv"] = {"vsplit_with_window_picker", desc = "Vertical"},

					[ BUFLEADER .. "fotn"] = {"open_tabnew", desc = "New"},
					[ BUFLEADER .. "fotd"] = {"open_tab_drop", desc = "Drop"},

					[ BUFLEADER .. "fd"] = {"delete", desc = "Delete" },
					[ BUFLEADER .. "fr"] = {"rename", desc = "Rename" },
					[ BUFLEADER .. "fa"] = { "add", desc = "Add" },
					[ BUFLEADER .. "da"] = {"add_directory", desc = "Add" },

					[ BUFLEADER .. "cc"] = {"close_node", desc = "Current node"},
					[ BUFLEADER .. "cs"] = {"close_all_subnodes", desc = "Sub & current nodes"},
					[ BUFLEADER .. "ca"] = {"close_all_nodes", desc = "All nodes"},
					[ BUFLEADER .. "ea"] = {"expand_all_nodes", desc = "All nodes"},

					[ BUFLEADER .. "i"] = {"show_file_details", desc = "Show details" },
					[ BUFLEADER .. "r"] = {"refresh", desc = "Refresh" },
					[ BUFLEADER .. "p"] = {"paste_from_clipboard", desc = "Paste" },
					[ BUFLEADER .. "<esc>"] = {"close_window",desc = "Quit" },
					[ BUFLEADER .. "x"] = {"cut_to_clipboard", desc = "Cut" },
					[ BUFLEADER .. "y"] = {"copy_to_clipboard", desc = "Copy" },
				}
			},
			filesystem = {
				filtered_items = {
					visible = NEOTREE_FILTERED_ITEMS_VISIBLE,
					hide_dotfiles = NEOTREE_FILTERED_ITEMS_HIDE_DOTFILES,
					hide_gitignored = NEOTREE_FILTERED_ITEMS_HIDE_GITIGNORED,
					hide_hidden = NEOTREE_FILTERED_ITEMS_HIDE_HIDDEN,
					hide_by_name = NEOTREE_FILTERED_ITEMS_HIDE_BY_NAME,
					hide_by_pattern = NEOTREE_FILTERED_ITEMS_HIDE_BY_PATTERN,
					always_show = NEOTREE_FILTERED_ITEMS_ALWAYS_SHOW,
					always_show_by_pattern = NEOTREE_FILTERED_ITEMS_ALWAYS_SHOW_BY_PATTERNS,
					never_show = NEOTREE_FILTERED_ITEMS_NEVER_SHOW,
					never_show_by_pattern = NEOTREE_FILTERED_ITEMS_NEVER_SHOW_BY_PATTERNS
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
						[ BUFLEADER .. "<"] = {"navigate_up", desc = "Go back"},
						[ BUFLEADER .. ">"] = {"set_root", desc = "Go front"},
						[ BUFLEADER .. "h"] = {"toggle_hidden", desc = "Show hidden"},
						[ BUFLEADER .. "ff"] = {"fuzzy_finder", desc = "Find" }, -- fuzzy sorting using the fzy algorithm
						[ BUFLEADER .. "df"] = {"fuzzy_finder_directory", desc = "Find"},
						[ BUFLEADER .. "gmp"] = {"prev_git_modified", desc = "Previous" },
						[ BUFLEADER .. "gmn"] = {"next_git_modified", desc = "Next" },
						[ BUFLEADER .. "oc"] = { "order_by_created", desc = "Created" },
						[ BUFLEADER .. "od"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ BUFLEADER .. "og"] = { "order_by_git_status", desc = "Git status" },
						[ BUFLEADER .. "om"] = { "order_by_modified", desc = "Modified" },
						[ BUFLEADER .. "on"] = { "order_by_name", desc = "Name" },
						[ BUFLEADER .. "os"] = { "order_by_size", desc = "Size" },
						[ BUFLEADER .. "ot"] = { "order_by_type", desc = "Type" },
					},
					fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
						["<c-n>"] = "move_cursor_down",
						["<c-p>"] = "move_cursor_up",
						["<c-j>"] = "move_cursor_down",
						["<c-k>"] = "move_cursor_up",
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
						["<"] = "navigate_up",
						[">"] = "set_root",
						["d"] = "buffer_delete",

						-- remapping 
						[ BUFLEADER .. "<"] = { "navigate_up", desc = "Go back"},
						[ BUFLEADER .. ">"] = { "set_root", desc = "Go front"},
						[ BUFLEADER .. "bd"] = { "buffer_delete", desc = "Delete"},
						[ BUFLEADER .. "bo"] = { function() end, desc = "Order", nowait = false },
						[ BUFLEADER .. "boc"] = { "order_by_created", desc = "Created" },
						[ BUFLEADER .. "bod"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ BUFLEADER .. "bog"] = { "order_by_git_status", desc = "Git status" },
						[ BUFLEADER .. "bom"] = { "order_by_modified", desc = "Modified" },
						[ BUFLEADER .. "bon"] = { "order_by_name", desc = "Name" },
						[ BUFLEADER .. "bos"] = { "order_by_size", desc = "Size" },
						[ BUFLEADER .. "bot"] = { "order_by_type", desc = "Type" },
					}
				}
			},
			git_status = {
				window = {
					mappings = {
						[ BUFLEADER .. "ga"] = { function() end, desc = "Add", nowait = false },
						[ BUFLEADER .. "gaa"] = { "git_add_all", desc = "All" },
						[ BUFLEADER .. "gac"] = { "git_add_file", desc = "Current" },
						[ BUFLEADER .. "gu"] = { "git_unstage_file", desc = "Unstage" },
						[ BUFLEADER .. "gr"] = { "git_revert_file", desc = "Revert" },
						[ BUFLEADER .. "gc"] = { "git_commit", desc = "Commit" },
						[ BUFLEADER .. "gp"] = { "git_push", desc = "Push" },
						[ BUFLEADER .. "gg"] = { "git_commit_and_push", desc = "Commit & push" },
						[ BUFLEADER .. "goc"] = { "order_by_created", desc = "Created" },
						[ BUFLEADER .. "god"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ BUFLEADER .. "gog"] = { "order_by_git_status", desc = "Git status" },
						[ BUFLEADER .. "gom"] = { "order_by_modified", desc = "Modified" },
						[ BUFLEADER .. "gon"] = { "order_by_name", desc = "Name" },
						[ BUFLEADER .. "gos"] = { "order_by_size", desc = "Size" },
						[ BUFLEADER .. "got"] = { "order_by_type", desc = "Type" },
					}
				}
			}
		})
	end
}

