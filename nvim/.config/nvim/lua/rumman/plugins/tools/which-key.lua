local which_key = require("which-key")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

which_key.setup({
	preset = "helix",
	delay = 250, -- delay for showing popup
	triggers = {
		{ "<auto>", mode = "nicvxso" },
	},
	replace = {
		key = {
			{ "<Space>", icons.keys.Space },
			{ "<Esc>", "Esc" },
			{ "<BS>", icons.keys.Backspace },
		},
	},
	win = {
		no_overlap = true,
		padding = { 0, 1 },
		border = {
			icons.ui.BorderTopLeft,
			icons.ui.BorderTop,
			icons.ui.BorderTopRight,
			icons.ui.BorderRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottom,
			icons.ui.BorderBottomLeft,
			icons.ui.BorderLeft,
		},
		title_pos = utils.ui.title_position
	},
	layout = {
		spacing = 1,
	},
	sort = { "group", "alphanum" },
	expand = 0, -- expand groups when <= n mappings
	icons = {
		breadcrumb = icons.ui.CircleRight,
		separator = icons.ui.CircleRight,
		group = icons.ui.CirclePlus,
		rules = false,
		keys = {
			Up = icons.keys.Up,
			Down = icons.keys.Down,
			Left = icons.keys.Left,
			Right = icons.keys.Right,
			C = icons.keys.Ctrl,
			M = icons.keys.Meta,
			D = icons.keys.Super,
			S = icons.keys.Shift,
			CR = icons.keys.CR,
			Esc = icons.keys.Esc,
			ScrollWheelDown = icons.keys.ScrollWheelDown,
			ScrollWheelUp = icons.keys.Up,
			NL = icons.keys.CR,
			BS = icons.keys.Backspace,
			Space = icons.keys.Space,
			Tab = icons.keys.Tab,
			F1 = icons.keys.F1,
			F2 = icons.keys.F2,
			F3 = icons.keys.F3,
			F4 = icons.keys.F4,
			F5 = icons.keys.F5,
			F6 = icons.keys.F6,
			F7 = icons.keys.F7,
			F8 = icons.keys.F8,
			F9 = icons.keys.F9,
			F10 = icons.keys.F10,
			F11 = icons.keys.F11,
			F12 = icons.keys.F12,
		},
	},
	disable = {
		ft = {
			"alpha"
		},
	},
})

