require("which-key").add({
		{ BUFLEADER, group = "Lsp" },
		{
			hidden = true,
			cond = true,
			{ "K", "<Nop>" }
		}
})

local function add_lsp_keymaps(hidden)
	require("which-key").add({
		hidden = hidden,
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
	})
	require("which-key").add({
		hidden = not hidden,
		{ BUFLEADER .. BUFLEADER, desc = "Lsp specific keymaps" },
	})
end

local lspattach_bufs = {}
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(lspattach)
		local current_buf = vim.api.nvim_get_current_buf()
		table.insert(lspattach_bufs, lspattach.buf)

		if current_buf == lspattach.buf then
			add_lsp_keymaps(false)
		end
	end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(bufenter)
		local found = false

		for _, value in ipairs(lspattach_bufs) do
			if bufenter.buf == value then
				found = true
				break
			end
		end

		add_lsp_keymaps(not found)
	end
})

