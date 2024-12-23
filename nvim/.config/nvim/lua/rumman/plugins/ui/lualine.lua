local lualine = require("lualine")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

lualine.setup({
	options = {
		theme = utils.colorscheme,
		always_show_tabline = false,
		globalstatus = true,
		section_separators = {
			left = utils.ui.spearator.left,
			right = utils.ui.spearator.right,
		},
		component_separators = { left = icons.ui.SeparatorRounded, right = icons.ui.SeparatorRounded },
		disabled_filetypes = {
			statusline = {
				"alpha",
			},
			winbar = {},
		},
		ignore_focus = {
			"neo-tree",
			"Telescope",
			"TelescopePromt",
		},
		refresh = {
			tabline = 5,
			statusline = 5,
			winbar = 5,
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str) return icons.ui.Vim .. str end
			},
		},
		lualine_b = {
			{
				"branch",
				icon = icons.ui.GitHub,
			},
			{
				"diff",
				colored = false,
				symbols = {
					added = icons.git.Add,
					modified = icons.git.Mod,
					removed = icons.git.Remove,
				},
			},
		},
		lualine_c = {
		},
		lualine_x = {
			"searchcount",
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
			},
			{
				"filename",
				path = 1,
				symbols = {
					modified = "",
					readonly = "",
					unnamed = "",
				},
			},
		},
		lualine_y = {
			{
				"filename",
				colored = false,
				fmt = function (str)
					local filetype = vim.bo.filetype
					local icon = ""
					if filetype == "help" then
						icon = icons.documents.File
					else
						icon = require("nvim-web-devicons").get_icon(filetype) or ""
					end
					return  icon .. " " .. str
				end,
				symbols = {
					modified = icons.ui.Edited,
					readonly = "",
					unnamed = "",
				}
			},
			{
				"diagnostics",
				colored = false,
				sources = { "nvim_lsp", "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warning,
					info = icons.diagnostics.Information,
					hint = icons.diagnostics.Hint
				},
			},
		},
		lualine_z = {
			"location",
			"progress",
		},
	},
})

