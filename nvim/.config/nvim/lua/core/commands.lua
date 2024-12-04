local commands = {
	"colorscheme " .. COLORSCHEME,
}

for _, cmd in ipairs(commands) do
	vim.cmd(cmd)
end

