local servers = require("plugins.servers.servers")
local mason_tool_installer = require("mason-tool-installer")

local all_in_one = {}
for _, server in ipairs(servers.lsp) do
	table.insert(all_in_one, server)
end
for _, server in ipairs(servers.dap) do
	table.insert(all_in_one, server)
end
for _, server in ipairs(servers.linter) do
	table.insert(all_in_one, server)
end

for _, server in ipairs(servers.formatter) do
	table.insert(all_in_one, server)
end

mason_tool_installer.setup({
	ensure_installed = all_in_one,
	auto_update = false,
	run_on_start = true,
	start_delay = 3000,
	-- at least 5 hours between attempts to install/update
	debounce_delay = 5,
})

