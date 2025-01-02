local func = require("rumman.lib.func")
local load_config = function(config)
	return function()
		func.requires("rumman.plugins." .. config)
	end
end

-- ============================================================================
-- addings rules
-- ----------------
-- config = plugins configuration
-- lazy = lazy loaded or not
-- enabled = disabled plugin & uninstalled
-- cond = disabled plugin
-- priority = force loading certain plugins first
-- version = version to use from the repository
-- branch = branch of the repository
-- tag = tag of the repository
-- name = custom name for the plugin
-- main = main module to use for config() and opts()
-- event = lazy load on event
-- ft = lazy load on filetypes
-- cmd = lazy load on command
-- keys = lazy load on keymaps
-- build = executed when a plugin is installed or updated
-- dependencies = plugins are dependded on this plugins
-- ============================================================================
return {
	----- ui -----
	{
		"ellisonleao/gruvbox.nvim",
		config = load_config("ui.gruvbox"),
		lazy = false,
		priority = 1000,
	},
	{
		"goolord/alpha-nvim",
		config = load_config("ui.alpha-nvim"),
		lazy = false,
	},
	{
		"stevearc/dressing.nvim",
		config = load_config("ui.dressing"),
		event = { "VeryLazy" },
	},
	{
		"nvim-lualine/lualine.nvim",
		config = load_config("ui.lualine"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"SmiteshP/nvim-navic",
				dependencies = {
					"neovim/nvim-lspconfig"
				}
			}
		},
	},
	{
		"b0o/incline.nvim",
		config = load_config("ui.incline"),
		event = { "BufReadPre" },
	},
	{
		"akinsho/bufferline.nvim",
		config = load_config("ui.bufferline"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"tiagovla/scope.nvim",
		},
	},
	{
		"folke/noice.nvim",
		config = load_config("ui.noice"),
		event = { "VeryLazy" },
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				enabled = false,
				config = load_config("ui.notify"),
			},
		},
	},


	----- tools -----
	{
		"rmagatti/auto-session",
		config = load_config("tools.auto-session"),
		event = { "VimLeavePre" },
		cmd = { "SessionRestore", "SessionSave" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = load_config("tools.neo-tree"),
		branch = "v3.x",
		event = { "VeryLazy" },
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				config = load_config("tools.window-picker"),
				version = "2.*",
				name = "window-picker",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		config = load_config("tools.telescope"),
		branch = "0.1.x",
		tag = "0.1.8",
		event = { "VeryLazy" },
		cmd = { "Telescope" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"Snikimonkd/telescope-git-conflicts.nvim",
		},
	},
	{
		"folke/which-key.nvim",
		config = load_config("tools.which-key"),
		event = { "VeryLazy" },
	},
	{
		"mrjones2014/smart-splits.nvim",
		config = load_config("tools.windows"),
		version = ">=1.0.0",
		event = { "VeryLazy" },
		dependencies = {
			"kwkarlwang/bufresize.nvim",
			{
				"anuvyklack/windows.nvim",
				dependencies = {
					"anuvyklack/middleclass",
					"anuvyklack/animation.nvim",
				},
			},
		},
	},
	{
		"chrisgrieser/nvim-spider",
		config = load_config("tools.spider"),
		enabled = false,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		config = load_config("tools.gitsigns"),
		event = { "BufReadPre" },
	},
	{
		"kdheepak/lazygit.nvim",
		config = load_config("tools.lazygit"),
		cmd = { "LazyGit" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"folke/flash.nvim",
		config = load_config("tools.flash"),
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"akinsho/toggleterm.nvim",
		config = load_config("tools.toggleterm"),
		version = "*",
		cmd = { "ToggleTerm" },
	},
	{
		"mbbill/undotree",
		config = load_config("tools.undotree"),
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Undotree" },
	},
	{
		"folke/snacks.nvim",
		config = load_config("tools.snacks"),
		event = { "VeryLazy" },
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons"
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = load_config("tools.grugfar"),
		cmd = { "GrugFar" },
	},
	{
		"barrett-ruth/live-server.nvim",
		config = load_config("tools.live-server"),
		cmd = { "LiveServerStart", "LiveServerStop" },
		build = "pnpm add -g live-server", -- npm install pnpm
	},
	{
		"derektata/lorem.nvim",
		config = load_config("tools.lorem"),
		cmd = { "LoremIpsum" },
	},
	{
		"3rd/image.nvim",
		config = load_config("tools.image");
		event = { "VeryLazy" },
	},
	{
		"m4xshen/hardtime.nvim",
		config = load_config("tools.hardtime"),
		event = { "VeryLazy" },
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"echasnovski/mini.ai",
		config = load_config("tools.mini"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
	},

	----- lang -----
	{
		"hrsh7th/nvim-cmp",
		config = load_config("lang.cmp"),
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"uga-rosa/cmp-dictionary",
			"hrsh7th/cmp-emoji",
			"chrisgrieser/cmp-nerdfont",
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					{
						"L3MON4D3/LuaSnip",
						version = "v2.*",
						dependencies = {
							"rafamadriz/friendly-snippets",
						},
					},
				},
			},
			{
				"windwp/nvim-autopairs",
				config = load_config("lang.autopairs"),
				dependencies = {
					"altermo/ultimate-autopair.nvim",
					branch = "v0.6",
				},
			},
			{
				"brenoprata10/nvim-highlight-colors",
				config = load_config("lang.highlight-colors"),
			},
		},
	},

	-- mason start
	{
		"williamboman/mason.nvim",
		config = load_config("lang.mason"),
		cmd = { "Mason" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
		}
	},
	-- mason end

	-- lsp start
	{
		"neovim/nvim-lspconfig",
		config = load_config("lang.lsp"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim"
				},
			},
			{
				"j-hui/fidget.nvim",
				config = load_config("lang.fidget"),
			}
		},
	},
	-- lsp end

	-- formatter start
	{
		"jay-babu/mason-null-ls.nvim",
		config = load_config("lang.formatter"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			"stevearc/conform.nvim",
		},
	},
	-- formatter end

	-- linter start
	{
		"rshkarin/mason-nvim-lint",
		config = load_config("lang.linter"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
	},
	-- linter end

	-- dap start
	{
		"mfussenegger/nvim-dap",
		config = load_config("lang.dap"),
		dependencies = {
			"Joakker/lua-json5",
			build = "./install.sh",
		},

	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = {
			"DapToggleBreakpoint",
			"DapContinue",
		},
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		}
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		-- javascript based
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap",
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
				version = "1.*",
			},
		},
	},
	{
		-- lua based
		"jbyuki/one-small-step-for-vimkind",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	-- dap end

	{
		"kylechui/nvim-surround",
		config = load_config("lang.surround"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mtrajano/tssorter.nvim",
		config = load_config("lang.tssorter"),
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = load_config("lang.treesitter"),
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
	},
	{
		"folke/todo-comments.nvim",
		config = load_config("lang.todo-comments"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		config = load_config("lang.comment"),
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"folke/trouble.nvim",
		config = load_config("lang.trouble"),
		cmd = { "Trouble" },
	},
	{
		"kevinhwang91/nvim-ufo",
		config = load_config("lang.ufo"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
}

