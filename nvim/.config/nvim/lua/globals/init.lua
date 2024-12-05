vim.g.mapleader = " "
vim.g.maplocalleader = ";"
BUFLEADER = "\\"
EXTRALEADER = ","
INSERTLEADER = "<a-space>"

COLORSCHEME = "gruvbox"

COMPLETEOPT = "menu,menuone,noinsert"
COMPLETEOPT_MAX_WIDTH = 40
COMPLETEOPT_MIN_WIDTH = 40

ALPHA_KEYS = {
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
	"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
	"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
}

SYMBOL_KEYS = {
	"~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+",
	"+", "[", "{", "]", "}", "\\", "|", ";", ":", "'", '"', ",", "<", ".", ">",
	"/", "?", "%", "^", "&", "*", "(", ")", "-", "_", "+",
}

NUM_KEYS = {
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
}

LOADED_ICON = " "
PENDING_ICON = "󱗽 "
UNLOADED_ICON = " "

UI_WIDTH = 0.7
UI_HEIGHT = 0.8
UI_TITLE_POSITION = "center"
UI_BORDER_STYLE = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
UI_WINDOW_BLEND = 7

TELESCOPE_LAYOUT_STRATEGY = "flex"
TELESCOPE_SORTING_STRATEGY = "descending"
TELESCOPE_UI_PREVIEW_CUTOFF = 40
TELESCOPE_UI_PREVIEW_WIDTH = 0.40
TELESCOPE_PROMPT_PREFIX = ""
TELESCOPE_PROMPT_TITLE = ""
TELESCOPE_PROMPT_POSITION = "bottom"
TELESCOPE_SELECTION_CARET = " "
TELESCOPE_RESULTS_TITLE = "Results"
TELESCOPE_INITIAL_MODE = "normal"

INDENT_SIZE = 2
INDENT_LINE_SYMBOL = "│"
TABSIZE = 2

MODIFIED_SYMBOL_ICON = " "
MODIFIED_SYMBOL_HIGHLIGHTS = "NeoTreeModified"

DIAGNOSTICS_SYMBOLS_HINT_ICON =" "
DIAGNOSTICS_SYMBOLS_INFO_ICON =" "
DIAGNOSTICS_SYMBOLS_WARN_ICON =" "
DIAGNOSTICS_SYMBOLS_ERROR_ICON = " "
DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS = "DiagnosticSignHint"
DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS = "DiagnosticSignInfo"
DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS = "DiagnosticSignWarn"
DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS = "DiagnosticSignError"

GIT_SYMBOLS_ADDED_ICON = " "
GIT_SYMBOLS_MODIFIED_ICON = "󱗝 "
GIT_SYMBOLS_DELETED_ICON = "󱋯 "
GIT_SYMBOLS_RENAMED_ICON = " "
GIT_SYMBOLS_UNTRACKED_ICON = " "
GIT_SYMBOLS_IGNORED_ICON = " "
GIT_SYMBOLS_UNSTAGED_ICON = " "
GIT_SYMBOLS_STAGED_ICON = " "
GIT_SYMBOLS_CONFLICT_ICON = " "

