-- lazy plugin file path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- try to find lazy plugin, if not then clone from git & install into lazypath
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git" -- lazy git repo

	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- add lazypath to the start of runtime path for priority loading
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	defaults = {
		lazy = true, -- all plugins will lazy loaded by default
		version = nil, -- "nil": latest git commit, "*": latest stable version
	},
	spec = {
		-- load plugins, plugins files/folders here
		{ import = "plugins" },
	},
	install = {
		--[[ install plugins, that is added but not installed yet, with a specific
		colorshceme ]]
		missing = true,
		colorscheme = { "retrobox" },
	},
	ui = {
		size = {
			width = UI_WIDTH,
			height = UI_HEIGHT,
		},
		border = UI_BORDER_STYLE,
		title = "Lazy plugin manager",
		title_pos = UI_TITLE_POSITION,
		backdrop = 60,
		piils = true,
		wrap = true,
		icons = {
			cmd = "",
			config = "",
			event = "",
			favorite = "",
			ft = "󰡯",
			import = "󰏔",
			keys = "󰌌",
			loaded = LOADED_ICON,
			not_loaded = UNLOADED_ICON,
			plugin = "",
			source = "󱃖",
			start = "",
			task = "",
			list = {
				"",
				"󰛂",
				"󰩳",
				"",
			},
		},
	},
	checker = {
		-- automatically check for plugi updates without notify
		enabled = true,
		notify = false,
	},
	change_detection = {
		-- any changes inside plugins will detect without notify
		enabled = true,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>q<cr>", {
			noremap = true,
			silent = true,
		})
	end,
})

