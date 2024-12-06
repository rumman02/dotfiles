local which_key = require("which-key")

local neo_tree_keys = function()
	return {
		{ BUFLEADER, desc = "Neotree" },
		{ BUFLEADER .. "b", desc = "Buffer" },
		{ BUFLEADER .. "c", desc = "Close" },
		{ BUFLEADER .. "d", desc = "Directory" },
		{ BUFLEADER .. "e", desc = "Expand" },
		{ BUFLEADER .. "f", desc = "File" },
		{ BUFLEADER .. "fo", desc = "Open" },
		{ BUFLEADER .. "fp", desc = "Preview" },
		{ BUFLEADER .. "fop", desc = "Pick window" },
		{ BUFLEADER .. "fot", desc = "Tab" },
		{ BUFLEADER .. "fd", desc = "Delete" },
		{ BUFLEADER .. "fr", desc = "Rename" },
		{ BUFLEADER .. "g", desc = "Git" },
		{ BUFLEADER .. "ga", desc = "Add" },
		{ BUFLEADER .. "gm", desc = "Modified" },
		{ BUFLEADER .. "h", desc = "Show hidden" },
		{ BUFLEADER .. "i", desc = "Show details" },
		{ BUFLEADER .. "o", desc = "Sort by" },
		{ BUFLEADER .. "p", desc = "Paste" },
		{ BUFLEADER .. "y", desc = "Copy" },
		{ BUFLEADER .. "r", desc = "Refresh" },
		{ BUFLEADER .. "x", desc = "Cut" },
		{ BUFLEADER .. "<", desc = "Backward" },
		{ BUFLEADER .. ">", desc = "Forward" },
		{ BUFLEADER .. "<cr>", desc = "Enter" },
		{ BUFLEADER .. "<esc>", desc = "Quit" },
	}
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(e)
		local current_filetype = vim.bo[e.buf].filetype

		if current_filetype == "neo-tree" then
			which_key.add(neo_tree_keys())
		end
	end,
})

