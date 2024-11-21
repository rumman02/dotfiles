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
NEOTREE_DEFAULT_POSITION = "left"
NEOTREE_DEFAULT_WINDOW_SIZE = 40
NEOTREE_POPUP_BORDER_STYLE = border_chars_2
NEOTREE_CHARACTER_FADE_ENABLE = true

NEOTREE_INDENT_SIZE = 2
NEOTREE_INDENT_PADDING = 0
NEOTREE_INDENT_SYMBOLS_LINE_ICON = "│"
NEOTREE_INDENT_SYMBOLS_LAST_LINE_ICON = "└"
NEOTREE_INDENT_SYMBOLS_HIGHLIGHTS = "NeoTreeIndentMarker"
NEOTREE_EXPANDER_SYMBOLS_COLLAPSED_ICON = ""
NEOTREE_EXPANDER_SYMBOLS_EXPANDED_ICON = ""
NEOTREE_EXPANDER_SYMBOLS_HIGHLIGHTS = "NeoTreeExpander"

NEOTREE_SOURCE_SELECTOR_WINBAR = false
NEOTREE_SOURCE_SELECTOR_STATUSLINE = true

NEOTREE_FOLDER_SYMBOLS_CLOSED_ICON = " 󰉋 "
NEOTREE_FOLDER_SYMBOLS_OPEN_ICON = " 󰝰 "
NEOTREE_FOLDER_SYMBOLS_EMPTY_ICON = " 󰉖 "
NEOTREE_FOLDER_SYMBOLS_HIGHLIGHTS = "NeoTreeFileIcon"

NEOTREE_MODIFIED_SYMBOL_ICON = modified_symbol_icon
NEOTREE_MODIFIED_SYMBOL_HIGHLIGHTS = modified_symbol_highlights

NEOTREE_DIAGNOSTICS_ENABLE = true
NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_ICON = diagnostics_symbols_hint_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_ICON = diagnostics_symbols_info_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_ICON = diagnostics_symbols_warn_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_ICON = diagnostics_symbols_error_icon
NEOTREE_DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS = diagnostics_symbols_hint_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS = diagnostics_symbols_info_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS = diagnostics_symbols_warn_highlights
NEOTREE_DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS = diagnostics_symbols_error_highlights

NEOTREE_GIT_SYMBOLS_ENABLE = true
NEOTREE_GIT_SYMBOLS_COLORS_ENABLE = true
NEOTREE_GIT_SYMBOLS_ADDED_ICON = git_symbols_added_icon
NEOTREE_GIT_SYMBOLS_MODIFIED_ICON = git_symbols_modified_icon
NEOTREE_GIT_SYMBOLS_DELETED_ICON = git_symbols_deleted_icon
NEOTREE_GIT_SYMBOLS_RENAMED_ICON = git_symbols_renamed_icon
NEOTREE_GIT_SYMBOLS_UNTRACKED_ICON = git_symbols_untracked_icon
NEOTREE_GIT_SYMBOLS_IGNORED_ICON = git_symbols_ignored_icon
NEOTREE_GIT_SYMBOLS_UNSTAGED_ICON = git_symbols_unstaged_icon
NEOTREE_GIT_SYMBOLS_STAGED_ICON = git_symbols_staged_icon
NEOTREE_GIT_SYMBOLS_CONFLICT_ICON = git_symbols_conflict_icon
NEOTREE_GIT_SYMBOLS_HIGHLIGHTS = "NeoTreeFileName"

NEOTREE_FILTERED_ITEMS_VISIBLE = false
NEOTREE_FILTERED_ITEMS_HIDE_DOTFILES = false
NEOTREE_FILTERED_ITEMS_HIDE_GITIGNORED = true
NEOTREE_FILTERED_ITEMS_HIDE_HIDDEN = false
NEOTREE_FILTERED_ITEMS_HIDE_BY_NAME = {
	".git",
	"node_modules"
}
NEOTREE_FILTERED_ITEMS_HIDE_BY_PATTERN = {}
NEOTREE_FILTERED_ITEMS_ALWAYS_SHOW = {}
NEOTREE_FILTERED_ITEMS_ALWAYS_SHOW_BY_PATTERNS = {}
NEOTREE_FILTERED_ITEMS_NEVER_SHOW = {}
NEOTREE_FILTERED_ITEMS_NEVER_SHOW_BY_PATTERNS = {}

-- nvim-cmp =======================================================================
CMP_MENU_BORDER_STYLE = border_chars_2
CMP_MENU_WINDOW_BLEND = 7
CMP_MENU_WINDOW_SCROLLBAR = true
CMP_MENU_BEHAVIOR = "menu,menuone,noinsert" -- noinsert for auto select the first item
CMP_MENU_ITEMS = { "abbr", "kind", "menu" } -- values are : "kind", "abbr", "menu" and this is the format of cmp item showing style
CMP_MENU_MAX_WIDTH = 40
CMP_MENU_MIN_WIDTH = 40
CMP_MENU_MODE = "symbol_text" -- Values are: "text", "text_symbol", "symbol_text", or "symbol"
CMP_MENU_SELECTION_PREVIEW = true
CMP_MENU_DOCS_AUTO_OPEN = false -- disable auto open docs

-- lsp =======================================================================
MASON_UI_SYMBOLS_PACKAGE_INSTALLED_ICON = package_loaded_icon
MASON_UI_SYMBOLS_PACKAGE_PENDING_ICON = package_pending_icon
MASON_UI_SYMBOLS_PACKAGE_UNINSTALLED_ICON = package_unloaded_icon
MASON_UI_BORDER_STYLE = border_chars_2
MASON_UI_WIDTH = ui_width
MASON_UI_HEIGHT = ui_height

