--[[ this funciton will help you to, not break every plugins, if a single
plugin will break. only that plugin will break and other plugins will run
smoothly without any problem ]]
local requires = function(module)
	status_ok, plugin = pcall(require, module)
	if not status_ok then
		local module = module:match("([^%.]+)$") -- extracts the last part
		vim.notify("WARNING!!! " .. '"' .. module .. '"' .. " plugin's not found!!!")
	else
		return plugin
	end
end

-- ============================================================================
-- enabled = disabled plugin & uninstalled
-- cond = disabled plugin
-- event = lazy load on event
-- cmd = lazy load on command
-- ft = lazy load on filetypes
-- keys = lazy load on key mapping
-- priority = force loading certain plugins first
-- ============================================================================
return {
	{
		-- tokyonight
		"folke/tokyonight.nvim",
		enabled = false,
		cond = true,
		event = {},
		cmd = {
			"Colorscheme tokyonight"
		},
		ft = {},
		keys = {},
		priority = 500,
		config = function()
		end
	},
	{
		-- gruvbox
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Colorscheme gruvbox"
		},
		ft = {},
		keys = {},
		priority = 500,
		config = function()
			requires("plugins.configs.gruvbox")
		end
	},
	{
		-- alpha_nvim
		"goolord/alpha-nvim",
		enabled = true,
		cond = true,
		event = {
			"VimEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 499,
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			requires("plugins.configs.alpha_nvim")
		end
	},
	{
		-- auto_session
		"rmagatti/auto-session",
		enabled = true,
		cond = true,
		event = {
			"VimLeavePre"
		},
		cmd = {
			"SessionRestore",
			"SessionSave"
		},
		ft = {},
		keys = {},
		priority = 498,
		config = function()
			requires("plugins.configs.auto_session")
		end
	},
	{
		-- neo_tree
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Neotree"
		},
		ft = {},
		keys = {},
		priority = 497,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		config = function()
		end
	},
	{
		-- telescope
		"nvim-telescope/telescope.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Telescope"
		},
		ft = {},
		keys = {},
		priority = 496,
		tag = '0.1.8',
		branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		config = function()
		end
	},
	{
		-- mason
		"williamboman/mason.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {
			"Mason"
		},
		ft = {},
		keys = {},
		priority = 495,
		config = function()
			requires("plugins.configs.mason")
		end
	},
	{
		-- mason_lspconfig
		"williamboman/mason-lspconfig.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 494,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
		end
	},
	{
		-- nvim_lspconfig
		"neovim/nvim-lspconfig",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 493,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
		end
	},
	{
		"windwp/nvim-autopairs",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 492,
		config = function()
		end
	},
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 491,
		config = function()
		end
	},
	{
		-- lua_snippets
		"L3MON4D3/LuaSnip",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 490,
		version = "v2.*",
		-- build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
		end
	},
	{
		-- cmp_lua_snippets
		"saadparwaiz1/cmp_luasnip",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 489,
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		config = function()
		end
	},
	{
		-- nvim_cmp
		"hrsh7th/nvim-cmp",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 488,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"dmitmel/cmp-cmdline-history",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"chrisgrieser/cmp-nerdfont",
			"uga-rosa/cmp-dictionary",
			"saadparwaiz1/cmp_luasnip",
			"windwp/nvim-autopairs",
			"brenoprata10/nvim-highlight-colors",
		},
		config = function()
			requires("plugins.configs.nvim_cmp")
		end
	},
	{
		"altermo/ultimate-autopair.nvim",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 487,
		config = function()
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 486,
		config = function()
			requires("plugins.configs.gitsigns")
		end
	},
}

