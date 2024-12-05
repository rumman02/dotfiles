local opt = vim.opt
local guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-c-ve:ver25", -- Insert, command-line, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait1-blinkoff1-blinkon1", -- All modes: blinking settings
}

local options = {
	number = false, -- show line number
	relativenumber = false, -- show relative number
	tabstop = TABSIZE, -- tab size
	shiftwidth = TABSIZE, -- indent shift size
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
	colorcolumn = "80", -- color the column for alignment
	guicursor = guicursor, -- cursor ui behavior
	completeopt = COMPLETEOPT, -- completeion menu behavior
	laststatus = 0, -- remove last split window status line
	statusline = "%=", -- removes all components from separator status line
	winwidth = 10, -- minimum number of columns for the current window
	winminwidth = 10, -- minimum width of a window
	equalalways = false, -- split windows are same size
	signcolumn = "auto:2-3", -- signs shows column size (minimum - maximum)
	sessionoptions = {
		"buffers",
		"tabpages",
		"globals",
		"curdir",
		"folds",
		"help",
		"winsize",
		"winpos",
		"terminal",
		"localoptions",
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

