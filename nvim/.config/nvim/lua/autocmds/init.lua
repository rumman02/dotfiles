-- creates a visible new blank line end of the line
vim.api.nvim_create_autocmd({ "BufWritePre"  }, {
	pattern = "*",
	callback = function()
		if vim.bo.modifiable and vim.fn.getline(vim.fn.line('$')) ~= '' then
			vim.fn.append(vim.fn.line('$'), "")
		end
	end
})

