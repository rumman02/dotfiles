-- main leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local l1 = "<leader>"
local l2 = "<leader><leader>"

local ll1 = "<localleader>"
local ll2 = "<localleader><localleader>"

local c1 = ","
local c2 = ",,"

local s1 = ";"
local s2 = ";;"

local il1 = "<c-,>"
local il2 = "<c-,><c-,>"

return {
	telescope = {
		leaders = {
			globals = l1 .. "f",
			locals = ll1,
		},
	},
	bufferline = {
		leaders = {
			globals = l1 .. "b",
		},
	},
	git = {
		leaders = {
			globals = l1 .. "g",
		},
	},
	flash = {
		leaders = {
			globals = l1 .. "s",
		},
	},
	linter = {
		leaders = {
			locals = ll1 .. "L",
		},
	},
	formatter = {
		leaders = {
			locals = ll1 .. "z",
		},
	},
	lsp = {
		leaders = {
			locals = ll1,
		},
	},
	trouble = {
		leaders = {
			locals = ll1 .. "t",
		},
	},
	neotree = {
		leaders = {
			globals = l1 .. "e",
			locals = ll1,
		},
	},
	surround = {
		leaders = {
			globals = c1 .. "s",
			insert = il1 .. "s",
		},
	},
	toggleterm = {
		leaders = {
			globals = l1 .. "t",
		},
	},
	windows = {
		leaders = {
			globals = l1 .. "w",
		},
	},
	session = {
		leaders = {
			globals = l2 .. "S",
		},
	},
	dap = {
		leaders = {
			globals = l1 .. "d"
		},
	},
	fold = {
		leaders = {
			globals = l1 .. "z",
		},
	},
	undotree = {
		leaders = {
			globals = l1 .. "u",
			locals = l1,
		},
	},
	options = {
		leaders = {
			globals = l2 .. "o",
		},
	},
	lazygit = {
		leaders = {
			globals = l1 .. "gg",
		},
	},
	comment = {
		leaders = {
			globals = "gc",
		},
	},
}

