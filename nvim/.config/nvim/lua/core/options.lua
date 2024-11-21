local opt = vim.opt

local options = {
	number = true, -- show line number
	relativenumber = true, -- show relative number
	tabstop = 2, -- tab size
	shiftwidth = 2, -- indent shift size
	expandtab = false, -- tab as space
	smartindent = true, -- get indent size from line/file smartly
	breakindent = true, -- breaked line also indented
	linebreak = true, -- line break with full word
	wrap = false, -- line wrap
	splitbelow = true, -- by default split window below
	splitright = true, -- by default split window right
	cursorline = false, -- highlight current line
	undofile = true, -- enables undo even after save and exit
	undolevels = 10000, -- number of undos
	ignorecase = true, -- ignore case sensitive while search
	smartcase = true, -- single capital letter makes search case sensitive
	inccommand = "split", -- open split window while while search and replace
	confirm = true, -- prompt for save changes
	mouse = "a", -- support mouse in all modes
	laststatus = 0, -- remove last split window status line
	sessionoptions = {
		"buffers",
		"curdir",
		"folds",
		"help",
		"tabpages",
		"winsize",
		"winpos",
		"terminal",
		"localoptions",
		"globals",
		"skiprtp"
	},
	fillchars = {
		eob = " ", -- remove "~" from eof
		vert = "│", -- split window vertical
		horiz = "─", -- split window horizontal
		fold = " ",
		foldopen = "",
		foldclose = "",
		foldsep = " ",
		diff = "╱"
	}
}

-- set all options here
for option, value in pairs(options) do
	opt[option] = value
end

