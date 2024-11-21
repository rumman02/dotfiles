local cmd = vim.cmd

local commands = {
	"colorscheme gruvbox"
}

for _, command in ipairs(commands) do
	cmd(command)
end

