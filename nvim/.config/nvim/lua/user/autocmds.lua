--          _    _ _______ ____   _____ __  __ _____  
--     /\  | |  | |__   __/ __ \ / ____|  \/  |  __ \ 
--    /  \ | |  | |  | | | |  | | |    | \  / | |  | |
--   / /\ \| |  | |  | | | |  | | |    | |\/| | |  | |
--  / ____ \ |__| |  | | | |__| | |____| |  | | |__| |
-- /_/    \_\____/   |_|  \____/ \_____|_|  |_|_____/ 

-- creates a visible new blank line end of the line ===============================
vim.api.nvim_create_autocmd({ "BufWritePre"  }, {
	pattern = "*",
	callback = function()
		if vim.bo.modifiable and vim.fn.getline(vim.fn.line('$')) ~= '' then
			vim.fn.append(vim.fn.line('$'), "")
		end
	end
})

