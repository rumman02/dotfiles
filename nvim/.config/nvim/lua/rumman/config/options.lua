local utils = require("rumman.lib.utils")

local options = {
	autoindent = true, --[[ copy indent from current line and apply that into next
	line ]]
	backspace = "indent,eol,start",
	breakindent = true, -- breaked line also indented
	cmdheight = 1, --[[ more heigth enables displaying messages in cmdline into
	file who have nothing ]]
	colorcolumn = "80",
	completeopt = utils.completeopt.behavior, --[[ menu, menuone (single options
	also shows as completion menu), noinsert (selects the first option by default) ]]
	conceallevel = 0, -- text is shown normally, even shows `` this also in .md file
	confirm = true, -- confirms the save changes before exiting modified buffer
	cursorline = false, -- enables current line highlighted
	equalalways = false, -- split windows are same size
	expandtab = false, -- converts tabs into spaces
	fillchars = {
		eob = " ", -- remove "~" from eof
		vert = "│", -- split window vertical
		horiz = "─", -- split window horizontal
		fold = " ",
		foldopen = "",
		foldclose = "",
		foldsep = " ",
		diff = "╱",
	},
	fileencoding = "utf-8", -- the encoding written to a file
	guicursor = {
		"n-v-c:block", -- normal, visual, command-line: block cursor
		"i-c-ve:ver25", --[[ insert, command-line, visual-exclude: vertical bar
		cursor with 25% width ]]
		"r-cr:hor20", --[[ replace, command-line replace: horizontal bar cursor
		with 20% height ]]
		"o:hor50", -- operator-pending: horizontal bar cursor with 50% height
		"a:blinkwait1-blinkoff1-blinkon1", -- All modes: blinking settings
	}, -- cursor ui behavior
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	inccommand = "split", -- open split window while while search and replace
	laststatus = 0, -- windows will have a status line always and only last window
	linebreak = true, -- line break with full word
	mouse = "a", -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	pumblend = utils.ui.window_blend, -- popup blend
	pumheight = utils.completeopt.max_height, -- pop up menu height
	relativenumber = true, -- set relative numbered lines
	scrolloff = 0, -- starts scrolling buffer before n number of rows
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
		"skiprtp",
	},
	shiftround = true, -- Round indent shiftwidth = 4, -- shifted indent size
	shiftwidth = utils.indent_size.editor,
	showcmd = true,
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	sidescrolloff = 8, -- starts scrolling buffer before n number of column
	signcolumn = "yes:2", --[[ always show the sign column, otherwise it would
	shift the text each time ]]
	smartcase = true, -- single capital letter makes search case sensitive
	smartindent = true, -- get indent size from line/file smartly
	smarttab = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	tabstop = utils.indent_size.editor, -- tab size
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, --[[ time to wait for a mapped sequence to complete (in
	milliseconds) ]]
	undofile = true, -- enable persistent undo
	undolevels = 10000, -- number of undos
	updatetime = 10, -- faster completion (4000ms default)
	wildmenu = true, -- wildmenu
	wildmode = "longest:full,full", -- Command-line completion mode
	winwidth = 5, -- minimum number of columns for the current window
	winminwidth = 5, -- minimum width of a window
	wrap = false, -- display lines as one long line
	writebackup = false, -- do not edit backups
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

