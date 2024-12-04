local which_key = require("which-key")

local telescope_keys = function ()
	return {
		{ BUFLEADER, desc = "Telescope"},
		{ BUFLEADER .. "f", desc = "File" },
		{ BUFLEADER .. "fo", desc = "Open" },
		{ BUFLEADER .. "foh", desc = "Left" },
		{ BUFLEADER .. "foj", desc = "Down" },
		{ BUFLEADER .. "fok", desc = "Up" },
		{ BUFLEADER .. "fol", desc = "Right" },
		{ BUFLEADER .. "fot", desc = "As Tab" },
		{ BUFLEADER .. "<tab>", desc = "Select & up" },
		{ BUFLEADER .. "<s-tab>", desc = "Select & down" },
		{ BUFLEADER .. "a", desc = "Add" },
		{ BUFLEADER .. "aa", desc = "All" },
		{ BUFLEADER .. "as", desc = "Selected" },
		{ BUFLEADER .. "<cr>", desc = "Enter"},
		{ BUFLEADER .. "<esc>", desc = "Quit"},
	}
end


vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function(e)
		local current_filetype = vim.bo[e.buf].filetype

		if current_filetype == "TelescopePrompt" then
			which_key.add(telescope_keys())
		end

	end
})

