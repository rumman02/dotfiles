local nvim_autopairs = require("nvim-autopairs")

nvim_autopairs.setup({
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	disable_in_replace_mode = true,
	map_bs = true, -- map the <BS> key
	map_c_h = false, -- map the <c-h> key to delete a pair
	map_c_w = false, -- map <c-w> to delete a pair if possible
})
