local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local lazy = require("lazy")
local version = vim.version()
local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch

-- header
-- set header top space
dashboard.opts.layout[1].val = 8

-- set header logo
dashboard.section.header.val = {
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                          " .. nvim_version,
}

-- set header below space
dashboard.opts.layout[3].val = 2

-- buttons
-- Set menu with buttons
local function new_button(...)
	local button = dashboard.button(...)
	button.opts.hl = { { "Special", 0, 6 } }
	return button
end

dashboard.section.buttons.val = {
	new_button("e", " " .. "󰙅  Open explorer", "<cmd>Neotree<cr>"),
	new_button("f", " " .. "󰱽  Find files", "<cmd>Telescope find_files<cr>"),
	new_button("w", " " .. "󱎸  Find words", "<cmd>Telescope live_grep<cr>"),
	new_button("r", " " .. "󱈅  Find recents", "<cmd>Telescope oldfiles<cr>"),
	new_button("S", " " .. "󱙈  Find sessions", "<cmd>Telescope session-lens<cr>"),
	new_button("s", " " .. "  Restore last session", "<cmd>SessionRestore<cr>"),
	new_button("p", " " .. "  Plugin manager", "<cmd>Lazy<cr>"),
	new_button("m", " " .. "  Server manager", "<cmd>Mason<cr>"),
	new_button(
		"c",
		" " .. "  Configs",
		"<cmd>e$MYVIMRC<Bar>lua require('neo-tree.command').execute({dir = vim.fn.stdpath('config')})<cr>"
	),
	new_button("n", " " .. "  New file", "<cmd>ene<Bar>startinsert<cr>"),
	new_button("x", " " .. "  Close", "<cmd>quit<cr>"),
}

-- set button below space
table.insert(dashboard.config.layout, 5, { type = "padding", val = 2 })

-- footer
-- footer set with date, time, lazy plugins count and loaded ms
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		local stats = lazy.stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

		local datetime = os.date("  %d-%m-%Y    %I:%M:%S %p")
		local plugins_count = #vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*", false, 1)
		local plugin_loaded = "󰄴  " .. plugins_count .. " plugins in " .. ms .. " ms"

		dashboard.section.footer.val = {
			string.format("%s  %s", datetime, plugin_loaded),
		}
		-- dashboard.section.footer.opts.hl = "@alpha.footer" -- foother highlight
		pcall(vim.cmd.AlphaRedraw)
	end,
})

-- others
-- disable folding on alpha buffer
vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

-- set whole dashboard to alpha
alpha.setup(dashboard.opts)

-- disable other keys in only alpha
vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		-- get the buffer number for alpha
		local buf = vim.api.nvim_get_current_buf()

		-- disable these keys in alpha buffer only
		local keys = {}
		for _, key in ipairs(ALPHA_KEYS) do
			table.insert(keys, key)
		end
		for _, key in ipairs(SYMBOL_KEYS) do
			table.insert(keys, key)
		end
		for _, key in ipairs(NUM_KEYS) do
			table.insert(keys, key)
		end

		for _, key in ipairs(keys) do
			vim.keymap.set("n", key, "<Nop>", {
				buffer = buf,
				noremap = true,
				silent = true,
			})
		end
	end,
})

--[[ fix: after install any plugins, the alpha dashboard will show after quit
lazy ui]]
if vim.o.filetype == "lazy" then
	vim.cmd.close()
	vim.api.nvim_create_autocmd("User", {
		pattern = "AlphaReady",
		callback = function()
			lazy.show()
		end,
	})
end

