local settings = require("plugins.servers.settings")
local mason_lspconfig = require("mason-lspconfig")
local lsp_config = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend("force", settings.nvim_capabilities, cmp_nvim_lsp.default_capabilities())

-- lsp servers settings
mason_lspconfig.setup_handlers({
	function(server_name)
		local server_configs = settings.server_settings[server_name] or {}
		lsp_config[server_name].setup({
			capabilities = capabilities,
			settings = server_configs.settings,
			on_init = server_configs.on_init,
			autostart = server_configs.autostart,
			cmd = server_configs.cmd,
			on_attach = settings.on_attach,
			filetypes = server_configs.filetypes,
			root_dir = server_configs.root_dir,
			handlers = vim.tbl_deep_extend("force", settings.default_handlers, server_configs.handlers or {}),
		})
	end,
})

