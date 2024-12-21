local treesitter = require("nvim-treesitter.configs")
local nvim_treesitter_context = require("treesitter-context")

local lang = require("rumman.lib.lang")


treesitter.setup({
	auto_install = true,
	ensure_installed = lang.treesitter.ensure_installed,
	ignore_install = {},
	modules = {},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

nvim_treesitter_context.setup({})

