local which_key = require("which-key")

local lsp_keys = function ()
	return {
		{ BUFLEADER, desc = "Lsp"},
		{ BUFLEADER .. "c", desc = "Code" },
		{ BUFLEADER .. "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions" },

		{ BUFLEADER .. "l", desc = "Lsp" },
		{ BUFLEADER .. "li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ BUFLEADER .. "lI", "<cmd>LspInstall<cr>", desc = "Install" },
		{ BUFLEADER .. "lr", "<cmd>LspRestart<cr>", desc = "Restart" },
		{ BUFLEADER .. "ls", function()
			if #vim.lsp.get_clients() > 0 then
				vim.cmd("LspStop")
				vim.notify("Lsp stopped...")
			else
				vim.cmd("LspStart")
				vim.notify("Lsp started...")
			end
		end, desc = "Strat/Stop" },
		{ BUFLEADER .. "lc", "<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<cr>", desc = "Server's capability" },

		{ BUFLEADER .. "r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ BUFLEADER .. "h", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

		{ BUFLEADER .. "f", desc = "Find" },
		{ BUFLEADER .. "fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ BUFLEADER .. "fs", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
		{ BUFLEADER .. "fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
		{ BUFLEADER .. "ft", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },
		{ BUFLEADER .. "fd", desc = "Diagnostic" },
		{ BUFLEADER .. "fda", "<cmd>Telescope diagnostics<cr>", desc = "All" },
		{ BUFLEADER .. "fdc", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Current" },
	}
end

local lspattach_bufs = {}
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(e)
		table.insert(lspattach_bufs, e.buf)
	end
})

vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter" }, {
	callback = function (e)

		for _, value in ipairs(lspattach_bufs) do
			if e.buf == value then
				which_key.add(lsp_keys())
			end
		end

	end
})

vim.api.nvim_create_autocmd({ "BufDelete" }, {
	callback = function (e)

		for i, buf in pairs(lspattach_bufs) do
			if buf == e.buf then
				table.remove(lspattach_bufs, i)
				break
			end
		end

	end
})

