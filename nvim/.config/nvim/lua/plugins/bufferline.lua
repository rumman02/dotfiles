return {
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"tiagovla/scope.nvim",
				opts = {}
			}
		},
		opts = function ()
			local bufferline = REQUIRE("bufferline")
			return {
				options = {
					mode = "buffers",
					style_preset = {
						bufferline.style_preset.default,
						bufferline.style_preset.no_italic,
						bufferline.style_preset.no_bold
					},
					themable = true,
					indicator = {
						icon = "▎",
						style = "icon",
					},
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							text_align = "center",
							separator = true,
							highlight = "Directory",
						}
					},
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_tab_indicators = true,
					show_duplicate_prefix = true,
					persist_buffer_sort = true,
					move_wraps_at_ends = true,
					separator_style = "slope",
					enforce_regular_tabs = true,
					always_show_bufferline = true,
					auto_toggle_bufferline = true,
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
				}
			}
		end
	},
	{
		{
			"romgrk/barbar.nvim",
			cond = false,
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"lewis6991/gitsigns.nvim",
				"nvim-tree/nvim-web-devicons",
				{
					"tiagovla/scope.nvim",
					opts = {}
				}
			},
			init = function() vim.g.barbar_auto_setup = false end,
			opts = function ()
				require('scope').setup {
					hooks = {
						pre_tab_leave = function()
							vim.api.nvim_exec_autocmds('User', {pattern = 'ScopeTabLeavePre'})
							vim.api.nvim_exec_autocmds('User', {pattern = 'Neotree close'})
						end,
						post_tab_enter = function()
							vim.api.nvim_exec_autocmds('User', {pattern = 'ScopeTabEnterPost'})
						end,
					}
				}
				return {
					animation = true,
					highlight_inactive_file_icons = true,
					icons = {
						preset = "default",
						button = false,
						modified = {
							button = "●",
						},
						pinned = {
							button = "",
							separator = {
								right = " "
							}
						},
						alternate = {},
						current = {},
						visible = {},
						separator_at_end = false,
						separator = {
							left = "│",
							right = "│"
						},
						inactive = {
							separator = {
								left = "",
								right = ""
							}
						},
					},
					sidebar_filetypes = { ["neo-tree"] = {event = "BufWipeout", align = "center", text = "Explorer"} }
				}
			end
		}
	}
}

