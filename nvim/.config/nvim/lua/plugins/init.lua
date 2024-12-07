--[[ this funciton will help you to, not break every plugins, if a single
plugin will break. only that plugin will break and other plugins will run
smoothly without any problem ]]
local requires = function(module)
	local status_ok, plugin = pcall(require, module)
	if not status_ok then
		module = module:match("([^%.]+)$") -- extracts the last part
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
		"folke/tokyonight.nvim",
		enabled = false,
		cond = true,
		event = {},
		cmd = {
			"Colorscheme tokyonight",
		},
		ft = {},
		keys = {},
		priority = 500,
		dependencies = {},
		config = function() end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Colorscheme gruvbox",
		},
		ft = {},
		keys = {},
		priority = 500,
		dependencies = {},
		config = function()
			requires("plugins.configs.gruvbox")
		end,
	},
	{
		"goolord/alpha-nvim",
		enabled = true,
		cond = true,
		event = {
			"VimEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 499,
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			requires("plugins.configs.alpha_nvim")
		end,
	},
	{
		"rmagatti/auto-session",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {
			"SessionRestore",
			"SessionSave",
		},
		ft = {},
		keys = {},
		priority = 498,
		dependencies = {},
		config = function()
			requires("plugins.configs.auto_session")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Neotree",
		},
		ft = {},
		keys = {},
		priority = 497,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		branch = "v3.x",
		config = function()
			requires("plugins.configs.neo_tree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		cond = true,
		event = {},
		cmd = {
			"Telescope",
		},
		ft = {},
		keys = {},
		priority = 496,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		tag = "0.1.8",
		branch = "0.1.x",
		config = function()
			requires("plugins.configs.telescope")
		end,
	},
	{
		"williamboman/mason.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {
			"Mason",
		},
		ft = {},
		keys = {},
		priority = 495,
		dependencies = {},
		config = function()
			requires("plugins.configs.mason")
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 495,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			requires("plugins.configs.mason_tool_installer")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 494,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function() end,
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			requires("plugins.configs.lsp")
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_autopairs")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_highlight_colors")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "v2.*",
		build = "make install_jsregexp",
		config = function() end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		config = function() end,
	},
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
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
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		branch = "v0.6",
		config = function()
			requires("plugins.configs.ultimate_autopair")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.gitsigns")
		end,
	},
	{
		"rcarriga/nvim-notify",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_notify")
		end,
	},
	{
		"folke/noice.nvim",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			requires("plugins.configs.noice")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		build = ":TSUpdate",
		config = function()
			requires("plugins.configs.nvim_treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_treesitter_context")
		end,
	},
	{
		"tiagovla/scope.nvim",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.scope")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"tiagovla/scope.nvim",
		},
		version = "*",
		config = function()
			requires("plugins.configs.bufferline")
		end,
	},
	{
		"romgrk/barbar.nvim",
		enabled = true,
		cond = false,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		version = "^1.0.0",
		config = function()
			requires("plugins.configs.barbar")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			requires("plugins.configs.lualine")
		end,
	},
	{
		"numToStr/Comment.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.comment")
		end,
	},
	{
		"folke/flash.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.flash")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		main = "ibl",
		config = function()
			requires("plugins.configs.indent_blankline")
		end,
	},
	{
		"kylechui/nvim-surround",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		version = "*",
		config = function()
			requires("plugins.configs.nvim_surround")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		cond = true,
		event = {},
		cmd = {},
		ft = {
			"js",
			"jsx",
			"ts",
			"tsx",
		},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_ts_autotag")
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		enabled = true,
		cond = true,
		event = {},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function() end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			requires("plugins.configs.todo_comments")
		end,
	},
	{
		"folke/which-key.nvim",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.which_key")
		end,
	},
	{
		"kwkarlwang/bufresize.nvim",
		enabled = true,
		cond = true,
		event = {
			"WinEnter",
			"BufEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.bufresize")
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		enabled = true,
		cond = true,
		event = {
			"WinEnter",
			"BufEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"kwkarlwang/bufresize.nvim",
		},
		version = ">=1.0.0",
		config = function()
			requires("plugins.configs.smart_splits")
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		enabled = true,
		cond = true,
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_ts_context_commentstring")
		end,
	},
	{
		"anuvyklack/windows.nvim",
		enabled = true,
		cond = true,
		event = {
			"WinEnter",
			"BufEnter",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			requires("plugins.configs.windows")
		end,
	},
	{
		"stevearc/dressing.nvim",
		enabled = true,
		cond = true,
		event = {
			"VeryLazy",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.dressing")
		end,
	},
	{
		"stevearc/conform.nvim",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		enabled = true,
		cond = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {},
		ft = {},
		keys = {},
		priority = 1,
		dependencies = {},
		config = function()
			requires("plugins.configs.nvim_lint")
		end,
	}
}

