--   _____ _      ____  ____          _      
--  / ____| |    / __ \|  _ \   /\   | |     
-- | |  __| |   | |  | | |_) | /  \  | |     
-- | | |_ | |   | |  | |  _ < / /\ \ | |     
-- | |__| | |___| |__| | |_) / ____ \| |____ 
--  \_____|______\____/|____/_/    \_\______|
--  global variables are used for reusing variables
--  also for, access some useful settings in a single place

-- variables ======================================================================
local g = vim.g
local modified_symbol_icon = " "
local modified_symbol_highlights = "NeoTreeModified"
local diagnostics_symbols_hint_icon = " "
local diagnostics_symbols_info_icon = " "
local diagnostics_symbols_warn_icon = " "
local diagnostics_symbols_error_icon =" "
local diagnostics_symbols_hint_highlights = "DiagnosticSignHint"
local diagnostics_symbols_info_highlights = "DiagnosticSignInfo"
local diagnostics_symbols_warn_highlights = "DiagnosticSignWarn"
local diagnostics_symbols_error_highlights = "DiagnosticSignError"
local git_symbols_added_icon = " "
local git_symbols_modified_icon = "󱗝 "
local git_symbols_deleted_icon = "󱋯 "
local git_symbols_renamed_icon = " "
local git_symbols_untracked_icon = " "
local git_symbols_ignored_icon = " "
local git_symbols_unstaged_icon = " "
local git_symbols_staged_icon = " "
local git_symbols_conflict_icon = " "
local border_chars_1 = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
local border_chars_2 = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
local ui_width = 0.7
local ui_height = 0.8
local package_loaded_icon = " "
local package_pending_icon = "󱗽 "
local package_unloaded_icon = " "
local window_blend = 7
local prompt_position = "bottom"
local preview_width = 0.40
local preview_cutoff = 40
local indent_size = 2
local indent_line_icon = "│"


-- safe require ===================================================================
REQUIRE = function(module)
	-- not break everything if any of plugin is broken
	local status_ok, plugin = pcall(require, module)

	if not status_ok then
		vim.notify("WARNING!!! " .. '"'.. module .. '"' .. " plugin is not found!!!")
	else
		return plugin
	end
end

-- map leaders ====================================================================
g.mapleader = " "
g.maplocalleader = ";"
BUFLEADER = "\\"
LSPLEADER = ","

-- lazy plugin manager ============================================================
LAZY = {}
LAZY_UI_WIDTH = ui_width
LAZY_UI_HEIGHT = ui_height
LAZY_UI_BORDER_STYLE = border_chars_2
LAZY_UI_SYMBOLS_PACKAGE_LOADED_ICON = package_loaded_icon
LAZY_UI_SYMBOLS_PACKAGE_NOT_LOADED_ICON = package_unloaded_icon

-- neo-tree =======================================================================
NEOTREE_POPUP_BORDER_STYLE = border_chars_2

NEOTREE_INDENT_SIZE = indent_size
NEOTREE_INDENT_SYMBOLS_LINE_ICON = indent_line_icon

NEOTREE_MODIFIED_SYMBOL_ICON = modified_symbol_icon
NEOTREE_MODIFIED_SYMBOL_HIGHLIGHTS = modified_symbol_highlights

NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_ICON = diagnostics_symbols_hint_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_ICON = diagnostics_symbols_info_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_ICON = diagnostics_symbols_warn_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_ICON = diagnostics_symbols_error_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS = diagnostics_symbols_hint_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS = diagnostics_symbols_info_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS = diagnostics_symbols_warn_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS = diagnostics_symbols_error_highlights

NEOTREE_GIT_SYMBOLS_ADDED_ICON = git_symbols_added_icon
NEOTREE_GIT_SYMBOLS_MODIFIED_ICON = git_symbols_modified_icon
NEOTREE_GIT_SYMBOLS_DELETED_ICON = git_symbols_deleted_icon
NEOTREE_GIT_SYMBOLS_RENAMED_ICON = git_symbols_renamed_icon
NEOTREE_GIT_SYMBOLS_UNTRACKED_ICON = git_symbols_untracked_icon
NEOTREE_GIT_SYMBOLS_IGNORED_ICON = git_symbols_ignored_icon
NEOTREE_GIT_SYMBOLS_UNSTAGED_ICON = git_symbols_unstaged_icon
NEOTREE_GIT_SYMBOLS_STAGED_ICON = git_symbols_staged_icon
NEOTREE_GIT_SYMBOLS_CONFLICT_ICON = git_symbols_conflict_icon

-- nvim-cmp =======================================================================
CMP_MENU_BORDER_STYLE = border_chars_2
CMP_MENU_WINDOW_BLEND = window_blend
CMP_MENU_WINDOW_SCROLLBAR = true
CMP_MENU_BEHAVIOR = "menu,menuone,noinsert" -- noinsert for auto select the first item
CMP_MENU_ITEMS = { "abbr", "kind", "menu" } -- values are : "kind", "abbr", "menu" and this is the format of cmp item showing style
CMP_MENU_MAX_WIDTH = 40
CMP_MENU_MIN_WIDTH = 40
CMP_MENU_MODE = "symbol_text" -- Values are: "text", "text_symbol", "symbol_text", or "symbol"
CMP_MENU_SELECTION_PREVIEW = true
CMP_MENU_DOCS_AUTO_OPEN = false -- disable auto open docs

-- lsp ============================================================================
MASON_UI_SYMBOLS_PACKAGE_INSTALLED_ICON = package_loaded_icon
MASON_UI_SYMBOLS_PACKAGE_PENDING_ICON = package_pending_icon
MASON_UI_SYMBOLS_PACKAGE_UNINSTALLED_ICON = package_unloaded_icon
MASON_UI_BORDER_STYLE = border_chars_2
MASON_UI_WIDTH = ui_width
MASON_UI_HEIGHT = ui_height

-- telescope ======================================================================
TELESCOPE_LAYOUT_STRATEGY = "flex" -- if enough space then horizontal layout else vertical layout
TELESCOPE_SORTING_STRATEGY = "descending"
TELESCOPE_INITIAL_MODE = "normal" -- telescope starts with normal mode, also another option is insert mode
TELESCOPE_PATH_DISPLAY = { "absolute" }
TELESCOPE_RESULTS_TITLE = "Results"
TELESCOPE_UI_WINDOW_BLEND = window_blend
TELESCOPE_UI_BORDER_STYLE = border_chars_1
TELESCOPE_PROMPT_PREFIX = ""
TELESCOPE_SELECTION_CARET = " "
TELESCOPE_PROMPT_TITLE = ""

TELESCOPE_UI_HORIZONTAL_WIDTH = ui_width
TELESCOPE_UI_HORIZONTAL_HEIGHT = ui_height
TELESCOPE_UI_HORIZONTAL_PREVIEW_WIDTH = preview_width
TELESCOPE_UI_HORIZONTAL_PROMPT_POSITION = prompt_position
TELESCOPE_UI_HORIZONTAL_PREVIEW_CUTOFF = preview_cutoff

TELESCOPE_UI_VERTICAL_WIDTH = ui_width
TELESCOPE_UI_VERTICAL_HEIGHT = ui_height
TELESCOPE_UI_VERTICAL_PREVIEW_WIDTH = preview_width
TELESCOPE_UI_VERTICAL_PROMPT_POSITION = prompt_position
TELESCOPE_UI_VERTICAL_PREVIEW_CUTOFF = preview_cutoff

-- auto session ===================================================================
AUTO_SESSION_LAYOUT_STRATEGY = "flex" -- if enough space then horizontal layout else vertical layout
AUTO_SESSION_SORTING_STRATEGY = "descending"
AUTO_SESSION_INITIAL_MODE = "normal" -- telescope starts with normal mode, also another option is insert mode
AUTO_SESSION_PATH_DISPLAY = { "absolute" }
AUTO_SESSION_RESULTS_TITLE = "Results"
AUTO_SESSION_UI_WINDOW_BLEND = window_blend
AUTO_SESSION_UI_BORDER_STYLE = border_chars_1
AUTO_SESSION_PROMPT_PREFIX = ""
AUTO_SESSION_SELECTION_CARET = " "
AUTO_SESSION_PROMPT_TITLE = ""
AUTO_SESSION_SUPPRESSED_DIRS = {}

AUTO_SESSION_UI_HORIZONTAL_WIDTH = ui_width
AUTO_SESSION_UI_HORIZONTAL_HEIGHT = ui_height
AUTO_SESSION_UI_HORIZONTAL_PREVIEW_WIDTH = preview_width
AUTO_SESSION_UI_HORIZONTAL_PROMPT_POSITION = prompt_position
AUTO_SESSION_UI_HORIZONTAL_PREVIEW_CUTOFF = preview_cutoff

AUTO_SESSION_UI_VERTICAL_WIDTH = ui_width
AUTO_SESSION_UI_VERTICAL_HEIGHT = ui_height
AUTO_SESSION_UI_VERTICAL_PREVIEW_WIDTH = preview_width
AUTO_SESSION_UI_VERTICAL_PROMPT_POSITION = prompt_position
AUTO_SESSION_UI_VERTICAL_PREVIEW_CUTOFF = preview_cutoff

-- which key ======================================================================
WHICH_KEY_UI_PRESET = "classic"
WHICH_KEY_UI_BORDER_STYLE = "rounded"
WHICH_KEY_UI_TITLE_POSITION = "center"

WHICH_KEY_SYMBOLS_BREADCRUMB_ICON = " "
WHICH_KEY_SYMBOLS_SEPARATOR_ICON = " "
WHICH_KEY_SYMBOLS_GROUP_ICON = "+"

WHICH_KEY_TIGGERS = {
	{ "<auto>", mode = "nicvxso" },
	{ "<leader>", mode = "nicvxso" },
	{ "s", mode = "nicvxso" },
	{ "\\", mode = "nicvxso" },
}
WHICH_KEY_DISABLE = {
	ft = {"alpha"},
}
WHICH_KEY_REPLACE = {
	key = {
		{ "<Space>", "Leader" }
	}
}

