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
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			source_selector = {
				winbar = true,
				statusline = false,
				sources = {
					{ source = "filesystem", display_name = "  Files " },
					{ source = "buffers", display_name = " 󰓩 Buffers " },
					{ source = "git_status", display_name = "  Git " },
				},
				content_layout = "center",
				tabs_layout = "equal"
			},
			default_component_configs = {
				container = {
					enable_character_fade = true
				},
				indent = {
					indent_size = 2,
					padding = 0,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = " 󰉋 ",
					folder_open = " 󰝰 ",
					folder_empty = " 󰉖 ",
					default = "*",
					highlight = "NeoTreeFileIcon"
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				diagnostics = {
					symbols = {
						hint =  " ",
						info =  " ",
						warn =  " ",
						error = " "
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError"
					},
				},
				name = {
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added = " ",
						modified = "󱗝 ",
						deleted = "󱋯 ",
						renamed = " ",
						untracked = " ",
						ignored = " ",
						unstaged = " ",
						staged = " ",
						conflict = " ",
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
					["a"] = { "add", desc = "Add file" },
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
					[ "\\fpo"] = {"toggle_preview", desc = "Open", config = {use_float = true, use_image_nvim = true}},
					[ "\\fpf"] = {"focus_preview", desc = "Focus"},

					[ "\\foh"] = {"open_leftabove_vs", desc = "Left"},
					[ "\\fol"] = {"open_vsplit", desc = "Right"},
					[ "\\foj"] = {"open_split", desc = "Down"},

					[ "\\fopc"] = {"open_with_window_picker", desc = "Current"},
					[ "\\foph"] = {"split_with_window_picker", desc = "Horizontal"},
					[ "\\fopv"] = {"vsplit_with_window_picker", desc = "Vertical"},

					[ "\\fotn"] = {"open_tabnew", desc = "New"},
					[ "\\fotd"] = {"open_tab_drop", desc = "Drop"},

					[ "\\fd"] = {"delete", desc = "Delete" },
					[ "\\fr"] = {"rename", desc = "Rename" },
					[ "\\fa"] = { "add", desc = "Add" },
					[ "\\da"] = {"add_directory", desc = "Add" },

					[ "\\cc"] = {"close_node", desc = "Current node"},
					[ "\\cs"] = {"close_all_subnodes", desc = "Sub & current nodes"},
					[ "\\ca"] = {"close_all_nodes", desc = "All nodes"},
					[ "\\ea"] = {"expand_all_nodes", desc = "All nodes"},

					[ "\\i"] = {"show_file_details", desc = "Show details" },
					[ "\\r"] = {"refresh", desc = "Refresh" },
					[ "\\p"] = {"paste_from_clipboard", desc = "Paste" },
					[ "\\<esc>"] = {"close_window",desc = "Quit" },
					[ "\\x"] = {"cut_to_clipboard", desc = "Cut" },
					[ "\\y"] = {"copy_to_clipboard", desc = "Copy" },
				}
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = false,
					hide_by_name = {
						".git",
						"node_modules"
					},
					hide_by_pattern = {},
					always_show = {},
					always_show_by_pattern = {},
					never_show = {},
					never_show_by_pattern = {},
				},
				follow_current_file = {
					enabled = false,
					leave_dirs_open = false,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = false,
				window = {
					mappings = {
						-- for easy access common keys
						["<"] = "navigate_up",
						[">"] = "set_root",
						["s"] = "fuzzy_finder",

						-- remapping 
						[ "\\<"] = {"navigate_up", desc = "Go back"},
						[ "\\>"] = {"set_root", desc = "Go front"},
						[ "\\h"] = {"toggle_hidden", desc = "Show hidden"},
						[ "\\ff"] = {"fuzzy_finder", desc = "Find" }, -- fuzzy sorting using the fzy algorithm
						[ "\\df"] = {"fuzzy_finder_directory", desc = "Find"},
						[ "\\gmp"] = {"prev_git_modified", desc = "Previous" },
						[ "\\gmn"] = {"next_git_modified", desc = "Next" },
						[ "\\oc"] = { "order_by_created", desc = "Created" },
						[ "\\od"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ "\\og"] = { "order_by_git_status", desc = "Git status" },
						[ "\\om"] = { "order_by_modified", desc = "Modified" },
						[ "\\on"] = { "order_by_name", desc = "Name" },
						[ "\\os"] = { "order_by_size", desc = "Size" },
						[ "\\ot"] = { "order_by_type", desc = "Type" },
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
						[ "\\<"] = { "navigate_up", desc = "Go back"},
						[ "\\>"] = { "set_root", desc = "Go front"},
						[ "\\bd"] = { "buffer_delete", desc = "Delete"},
						[ "\\bo"] = { function() end, desc = "Order", nowait = false },
						[ "\\boc"] = { "order_by_created", desc = "Created" },
						[ "\\bod"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ "\\bog"] = { "order_by_git_status", desc = "Git status" },
						[ "\\bom"] = { "order_by_modified", desc = "Modified" },
						[ "\\bon"] = { "order_by_name", desc = "Name" },
						[ "\\bos"] = { "order_by_size", desc = "Size" },
						[ "\\bot"] = { "order_by_type", desc = "Type" },
					}
				},
			},
			git_status = {
				window = {
					mappings = {
						[ "\\ga"] = { function() end, desc = "Add", nowait = false },
						[ "\\gaa"] = { "git_add_all", desc = "All" },
						[ "\\gac"] = { "git_add_file", desc = "Current" },
						[ "\\gu"] = { "git_unstage_file", desc = "Unstage" },
						[ "\\gr"] = { "git_revert_file", desc = "Revert" },
						[ "\\gc"] = { "git_commit", desc = "Commit" },
						[ "\\gp"] = { "git_push", desc = "Push" },
						[ "\\gg"] = { "git_commit_and_push", desc = "Commit & push" },
						[ "\\goc"] = { "order_by_created", desc = "Created" },
						[ "\\god"] = { "order_by_diagnostics", desc = "Diagnostics" },
						[ "\\gog"] = { "order_by_git_status", desc = "Git status" },
						[ "\\gom"] = { "order_by_modified", desc = "Modified" },
						[ "\\gon"] = { "order_by_name", desc = "Name" },
						[ "\\gos"] = { "order_by_size", desc = "Size" },
						[ "\\got"] = { "order_by_type", desc = "Type" },
					}
				}
			}
		})
	end
}

