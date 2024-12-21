local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

vim.g.lazygit_floating_window_winblend = utils.ui.window_blend -- transparency of floating window

vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window

vim.g.lazygit_floating_window_border_chars = {
		icons.ui.BorderTopLeft,
		icons.ui.BorderTop,
		icons.ui.BorderTopRight,
		icons.ui.BorderRight,
		icons.ui.BorderBottomRight,
		icons.ui.BorderBottom,
		icons.ui.BorderBottomLeft,
		icons.ui.BorderLeft,
} -- customize lazygit popup window border characters

vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1

vim.g.lazygit_config_file_path = '' -- custom config file path
-- -- OR
-- vim.g.lazygit_config_file_path = {} -- table of custom config file paths

vim.g.lazygit_on_exit_callback = nil -- optional function callback when exiting lazygit (useful for example to refresh some UI elements after lazy git has made some changes)

