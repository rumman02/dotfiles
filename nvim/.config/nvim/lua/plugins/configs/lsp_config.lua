local servers = {
	"lua_ls",
	"ts_ls",
	"html",
	"cssls",
	"jsonls"
}

local default_handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = UI_BORDER_STYLE }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = UI_BORDER_STYLE }),
}

local nvim_capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_capabilities.textDocument.completion.completionItem.snippetSupport = true

local server_settings = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT"
				},
				diagnostics = {
					globals = { "vim" }
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true)
				},
				telemetry = {
					enable = false
				}
			}
		}
	}
}

local on_attach = function(client, bufnr)
	-- if client.name == "ts_ls" then
	-- 	client.server_capabilities.documentFormattingProvider = true
	-- end
end

local mason_lspconfig =  require("mason-lspconfig")
local lsp_config = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend("force", nvim_capabilities, cmp_nvim_lsp.default_capabilities())

-- mason lspconfig settings
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true
})

-- lsp servers settings
mason_lspconfig.setup_handlers({
	function(server_name)
		local server_configs = server_settings[server_name] or {}
		lsp_config[server_name].setup({
			capabilities = capabilities,
			settings = server_configs.settings,
			on_init = server_configs.on_init,
			autostart = server_configs.autostart,
			cmd = server_configs.cmd,
			on_attach = on_attach,
			filetypes = server_configs.filetypes,
			root_dir = server_configs.root_dir,
			handlers = vim.tbl_deep_extend("force", default_handlers, server_configs.handlers or {})
		})
	end,
})

