-- creates a visible new blank line end of the line
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modifiable and vim.fn.getline(vim.fn.line("$")) ~= "" then
			vim.fn.append(vim.fn.line("$"), "")
		end
	end,
})

-- creates a dynamic cursor column at insert mode
vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI" }, {
	callback = function()
			vim.opt.colorcolumn = "80"
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.colorcolumn = ""
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.opt.colorcolumn = ""
	end,
})

