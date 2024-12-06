local nvim_treesitter = require("nvim-treesitter.configs")

---@diagnostic disable-next-line: missing-fields
nvim_treesitter.setup({
	ensure_installed = {
		"bash",
		"css",
		"html",
		"gitignore",
		"javascript",
		"json",
		"lua",
		"markdown",
		"tsx",
		"typescript",
		"vimdoc",
	},
	sync_install = true,
	auto_install = true,
	ignore_install = {},
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

