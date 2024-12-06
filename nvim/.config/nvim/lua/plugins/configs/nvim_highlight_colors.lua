local nvim_highlight_colors = require("nvim-highlight-colors")

nvim_highlight_colors.setup({
	render = "background",
	virtual_symbol = "██",
	exclude_filetypes = { "notify", "noice" },
	exclude_buftypes = {},
})

