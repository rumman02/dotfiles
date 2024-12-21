-- how windows are place with positions
-- 							topleft
-- 							+---------+
-- 	leftabove				| New     |
-- 	+---------+---------+	+---------+
--	| New     | Current | 	| Current |
-- 	+---------+---------+ 	+---------+
-- 							botright
-- 							+---------+
-- 	rightbelow				| Current |
--  +---------+---------+  	+---------+
--  | Current | New     |  	| New     |
--  +---------+---------+  	+---------+
-- 							horizontal
--     						+---------+
-- vertical				    | Window1 |
-- +---------+---------+    +---------+
-- | Window1 | Window2 |    | Window2 |
-- +---------+---------+    +---------+

------ globals
local func = require("rumman.lib.func")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- copy
map({ "v", "x" }, "<c-y>", '"+ygv <esc>h', opts)
map("n", "<c-y>", '"+y', opts)
map({ "v", "x" }, "y", "ygv <esc>h", opts)

-- save/quit
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", opts)
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>quitall<cr>", opts)

-- incremental/decremenal
map("n", "+", "<c-a>", opts)
map("n", "-", "<c-x>", opts)

-- indentation
map({ "v", "x" }, "<", "<gv", opts)
map({ "v", "x" }, ">", ">gv", opts)

-- buffer/tabs
if vim.fn.executable("bufferline") ~= 1 then
	map( "n", "<a-h>", "<cmd>bprevious<cr>" )
	map( "n", "<a-l>", "<cmd>bnext<cr>" )
	map( "n", "[b", "<cmd>bprevious<cr>", { desc = "Buffer prev" } )
	map( "n", "]b", "<cmd>bnext<cr>", { desc = "Buffer next" } )
	map( "n", "<tab>xc", "<cmd>tabclose<cr>", { desc = "Current" } )
	map( "n", "<tab>xo", "<cmd>tabclose<cr>", { desc = "Others" } )
	map( "n", "<tab>f", "<cmd>tabclose<cr>", { desc = "First" } )
	map( "n", "<tab>l", "<cmd>tabclose<cr>", { desc = "Last" } )
	map( "n", "<tab>L", "<cmd>tabclose<cr>", { desc = "List" } )
end
map( "n", "<a-j>", "<cmd>tabnext<cr>" )
map( "n", "<a-k>", "<cmd>tabprevious<cr>" )
map( "n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" } )
map( "n", "[t", "<cmd>tabprevious<cr>", { desc = "Prev tab" } )

-- cursor movement
map("i", "<c-h>", "<left>", opts)
map("i", "<c-l>", "<right>", opts)
map("i", "<c-k>", "<up>", opts)
map("i", "<c-j>", "<down>", opts)
map("i", "<c-s-k>", "<esc>O", opts)
map("i", "<c-s-j>", "<esc>o", opts)

-- moveline
map({ "v", "x" }, "<a-k>", ":m '<-2<cr>gv=gv", opts)
map({ "v", "x" }, "<a-j>", ":m '>+1<cr>gv=gv", opts)
map({ "v", "x" }, "<a-h>", "<gv", opts)
map({ "v", "x" }, "<a-l>", ">gv", opts)

-- cmdline
map("c", "<c-h>", "<cmd>Telescope command_history<cr>", opts)

-- windows
if vim.fn.executable("smart-splits") ~= 1 then
	map ( "n", "<c-h>", "<c-w>h", { desc = "Left" } )
	map ( "n", "<c-j>", "<c-w>j", { desc = "Down" } )
	map ( "n", "<c-k>", "<c-w>k", { desc = "Up" } )
	map ( "n", "<c-l>", "<c-w>l", { desc = "Right" } )
	map ( "n", "<c-p>", "<c-w>w", { desc = "Previous" } )
end

-- fixes some keymaps that was annoying
map("n", "q", func.handle_q_colon_key, opts)
map({ "v", "x" }, "p", '"_dP', opts)
map("n", "x", '"_x', opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)


local which_key = require("which-key")
local option_leader = require("rumman.lib.keys").options.leaders.globals
local loop_keymaps = func.loop_keymaps

-- renamed keymaps
which_key.add({
	{ "<leader><leader>", desc = "More..." },
	{ "<localleader><localleader>", desc = "More..." },
})

-- options
which_key.add({
	{ option_leader, group = "Options" },
	{ option_leader .. "c", group = "Cursor" },
	{ option_leader .. "ch", group = "Highlight" },
	{ option_leader .. "cs", group = "Scrolloff" },
	{ option_leader .. "l", group = "Line" },
	{ option_leader .. "ln", group = "Number" },

	loop_keymaps( option_leader .. "l", true, option_leader .. "lw", "<cmd>set wrap! <cr>", { desc = "Wrap" }),
	loop_keymaps( option_leader .. "ln", true, option_leader .. "lnn", "<cmd>set number!<cr>", { desc = "Absolute" }),
	loop_keymaps( option_leader .. "ln", true, option_leader .. "lnr", "<cmd>set relativenumber!<cr>", { desc = "Relative" }),

	loop_keymaps( option_leader .. "ch", true, option_leader .. "chl", "<cmd>set cursorline! <cr>", { desc = "Line" } ),
	loop_keymaps( option_leader .. "ch", true,  option_leader .. "chc", "<cmd>set cursorcolumn! <cr>", { desc = "Column" }),

	loop_keymaps( option_leader .. "cs", true, option_leader .. "csx", function()
		local before_scrolloff = vim.o.scrolloff
		if vim.o.scrolloff == 999 then
			vim.o.scrolloff = before_scrolloff
		else
			vim.o.scrolloff = 999
		end
	end, { desc = "Middle line", }),
	loop_keymaps( option_leader .. "cs", true, option_leader .. "csy", function()
		local before_sidescrolloff = vim.o.sidescrolloff

		if vim.o.sidescrolloff == 999 then
			vim.o.sidescrolloff = before_sidescrolloff
		else
			vim.o.sidescrolloff = 999
		end
	end, { desc = "Middle Column", }),
})


------ plugins
---- dap
-- normal keymaps
local dap_leader = require("rumman.lib.keys").dap.leaders.globals
which_key.add({
	{ dap_leader, group = "Debug" },

    { dap_leader .. "b", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
    { dap_leader .. "B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint with condition" },

	{ dap_leader .. "r", function() require("dap").continue() end, desc = "Run" },
	---@diagnostic disable-next-line: undefined-global
    { dap_leader .. "a", function() require("dap").continue({ before = get_args }) end, desc = "Run With args" },
    { dap_leader .. "c", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
    { dap_leader .. "l", function() require("dap").run_last() end, desc = "Run last" },

	loop_keymaps( dap_leader, true, dap_leader .. "o", function() require("dap").step_out() end, { desc = "Step out" }),
	loop_keymaps( dap_leader, true, dap_leader .. "v", function() require("dap").step_over() end,{ desc = "Step over" }),
	loop_keymaps( dap_leader, true, dap_leader .. "i", function() require("dap").step_into() end, { desc = "Step into" }),

    { dap_leader .. "g", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    loop_keymaps( dap_leader, true, dap_leader .. "j", function() require("dap").down() end, { desc = "Go down" }),
    loop_keymaps( dap_leader, true, dap_leader .. "k", function() require("dap").up() end, { desc = "Go up" }),


    { dap_leader .. "u", function() require("dapui").toggle({}) end, desc = "Toggle dapui" },
    { mode = {"n", "v"}, dap_leader .. "e", function() require("dapui").eval() end, desc = "Eval dapui" },

    { dap_leader .. "p", function() require("dap").pause() end, desc = "Pause" },
    { dap_leader .. "R", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { dap_leader .. "s", function() require("dap").session() end, desc = "Session" },
    { dap_leader .. "w", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },

    { dap_leader .. "t", function() require("dap").terminate() end, desc = "Terminate" },

	{ dap_leader .. "L", group = "For lua" },
	{ dap_leader .. "Lp", function () require("osv").launch({port = 8086}) end, desc = "Launch port" },
	{ dap_leader .. "Lw", function () require("dap.ui.widgets").widgets.hover() end, desc = "Lua widgets" },
	{ dap_leader .. "Lf", function () local widgets = require("dap.ui.widgets") widgets.widgets.centered_float(widgets.frames) end, desc = "Widgets float" },
})


---- lsp
-- local keymaps
local lsp_leader = require("rumman.lib.keys").lsp.leaders.locals
local linter_leader = require("rumman.lib.keys").linter.leaders.locals
local lint_autocmd_id = nil
local formatter_leader = require("rumman.lib.keys").formatter.leaders.locals
local trouble_leader = require("rumman.lib.keys").trouble.leaders.locals

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

-- lsp local keys
local function lsp_inside_keys(buf)
	return {
		buffer = buf,
		{ lsp_leader, desc = "Lsp" },
		{ lsp_leader .. "d", desc = "Diagnostics" },
		{ lsp_leader .. "de", desc = "Error" },
		{ lsp_leader .. "dw", desc = "Warn" },
		{ lsp_leader .. "dh", desc = "Hint" },
		{ lsp_leader .. "di", desc = "Info" },
		{ lsp_leader .. "c", desc = "Code" },
		{ lsp_leader .. "l", desc = "Lsp" },
		{ lsp_leader .. "f", desc = "Find" },
		{ lsp_leader .. "fd", desc = "Diagnostic" },

		{ lsp_leader .. "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions" },

		{ "]d",  diagnostic_goto(true), desc = "Next Diag" },
		{ "[d",  diagnostic_goto(false), desc = "Prev Diag" },
		{ "]e",  diagnostic_goto(true, "ERROR"), desc = "Next diag (Error)" },
		{ "[e",  diagnostic_goto(false, "ERROR"), desc = "Prev diag (Error)" },
		{ "]i",  diagnostic_goto(true, "INFO"), desc = "Next diag (Info)" },
		{ "[i",  diagnostic_goto(false, "INFO"), desc = "Prev diag (Info)" },
		{ "]w",  diagnostic_goto(true, "WARN"), desc = "Next diag (Warn)" },
		{ "[w",  diagnostic_goto(false, "WARN"), desc = "Prev diag (Warn)" },
		{ "]h",  diagnostic_goto(true, "HINT"), desc = "Next diag (Hint)" },
		{ "[h",  diagnostic_goto(false, "HINT"), desc = "Prev diag (Hint)" },

		{ lsp_leader .. "li", "<cmd>LspInfo<cr>", desc = "Info" },
		{ lsp_leader .. "lI", "<cmd>LspInstall<cr>", desc = "Install" },
		{ lsp_leader .. "lr", "<cmd>LspRestart<cr>", desc = "Restart" },
		{
			lsp_leader .. "ls",
			function()
				if #vim.lsp.get_clients() > 0 then
					vim.cmd("LspStop")
					vim.notify("Lsp stopped...")
				else
					vim.cmd("LspStart")
					vim.notify("Lsp started...")
				end
			end,
			desc = "Strat/Stop",
			buffer = buf,
		},
		{
			lsp_leader .. "lc",
			"<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<cr>",
			desc = "Server's capability",
			buffer = buf,
		},

		{ lsp_leader .. "r", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
		{ lsp_leader .. "h", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },

		{ lsp_leader .. "fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ lsp_leader .. "fs", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
		{ lsp_leader .. "fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
		{ lsp_leader .. "ft", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },
		{ lsp_leader .. "fda", "<cmd>Telescope diagnostics<cr>", desc = "All" },
		{ lsp_leader .. "fdc", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Current" },

		loop_keymaps( lsp_leader .. "d", true, lsp_leader .. "ds",  vim.diagnostic.open_float, { desc = "Diagnostics show" }),
		loop_keymaps( lsp_leader .. "d", true, lsp_leader .. "dn",  diagnostic_goto(true), { desc = "Next Diagnostic" }),
		loop_keymaps( lsp_leader .. "d", true, lsp_leader .. "dp",  diagnostic_goto(false), { desc = "Prev Diagnostic" }),
		loop_keymaps( lsp_leader .. "de", true, lsp_leader .. "den", diagnostic_goto(true, 'ERROR'), { desc = "Next" }),
		loop_keymaps( lsp_leader .. "de", true, lsp_leader .. "dep", diagnostic_goto(false, 'ERROR'), { desc = "Previous" }),
		loop_keymaps( lsp_leader .. "dw", true, lsp_leader .. "dwn", diagnostic_goto(true, 'WARN'), { desc = "Next" }),
		loop_keymaps( lsp_leader .. "dw", true, lsp_leader .. "dwp", diagnostic_goto(false, 'WARN'), { desc = "Previous" }),
		loop_keymaps( lsp_leader .. "dh", true, lsp_leader .. "dhn", diagnostic_goto(true, 'HINT'), { desc = "Next" }),
		loop_keymaps( lsp_leader .. "dh", true, lsp_leader .. "dhp", diagnostic_goto(true, 'HINT'), { desc = "Previous" }),
		loop_keymaps( lsp_leader .. "di", true, lsp_leader .. "din", diagnostic_goto(false, 'INFO'), { desc = "Next" }),
		loop_keymaps( lsp_leader .. "di", true, lsp_leader .. "dip", diagnostic_goto(false, 'INFO'), { desc = "Previous" }),

		{ linter_leader, group = "Linter" },
		{
			linter_leader .. "t",
			function()
				if not lint_autocmd_id then
					lint_autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
						callback = function()
							require("lint").try_lint()
						end,
						group = vim.api.nvim_create_augroup("LintAutocmdGroup", { clear = true }),
					})
					vim.notify("Linting enabled on BufWritePost", vim.log.levels.INFO)
				else
					vim.notify("Linting is already enabled", vim.log.levels.WARN)
				end
			end,
			desc = "Enable lint (After save)",
		},
		{
			linter_leader .. "x",
			function()
				if lint_autocmd_id then
					vim.api.nvim_del_autocmd(lint_autocmd_id)
					lint_autocmd_id = nil
					vim.notify("Linting disabled on BufWritePost", vim.log.levels.INFO)
				else
					vim.notify("Linting is already disabled", vim.log.levels.WARN)
				end
			end,
			desc = "Disable lint (After save)",
		},
		{
			linter_leader .. "c",
			function()
				require("lint").try_lint()
			end,
			desc = "Current check",
		},

		{ formatter_leader, group = "Formatter" },
		{
			formatter_leader .. "z",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v", "x" },
			desc = "Format by conform",
		},
		{ formatter_leader .. "Z", vim.lsp.buf.format, mode = { "n", "v", "x" }, desc = "Format by lsp" },

		{ trouble_leader, desc = "Trouble" },
		{ trouble_leader .. "x", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle" },
		{ trouble_leader .. "X", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
		{ trouble_leader .. "s", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
		{ trouble_leader .. "l", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
		{ trouble_leader .. "L", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
		{ trouble_leader .. "Q", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
	}
end


-- adding lsp-attached bufnr into lspattach_bufs table
local lspattach_bufs = {}
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(e)
		table.insert(lspattach_bufs, e.buf)
	end,
})

-- sets lsp-attached keys
vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter" }, {
	callback = function(n)
		for _, value in ipairs(lspattach_bufs) do
			if n.buf == value then
				which_key.add(lsp_inside_keys(n.buf))
			end
		end
	end,
})

-- delete bufnr if buffer deleted
vim.api.nvim_create_autocmd({ "BufDelete" }, {
	callback = function(e)
		for i, buf in pairs(lspattach_bufs) do
			if buf == e.buf then
				table.remove(lspattach_bufs, i)
				break
			end
		end
	end,
})

---- surround
local surround_leader = require("rumman.lib.keys").surround.leaders.globals
local surround_leader_insert = require("rumman.lib.keys").surround.leaders.insert
which_key.add({
	{ surround_leader, group = "Surround" },
	{ surround_leader .. "s", "<Plug>(nvim-surround-normal)", desc = "Normal" },
	{ surround_leader .. "l", "<Plug>(nvim-surround-normal-cur)", desc = "Current line" },
	{ surround_leader .. "S", "<Plug>(nvim-surround-normal-line)", desc = "Normal with new line" },
	{ surround_leader .. "L", "<Plug>(nvim-surround-normal-cur-line)", desc = "Current line with new line" },
	{ surround_leader .. "c", "<Plug>(nvim-surround-change)", desc = "Change" },
	{ surround_leader .. "C", "<Plug>(nvim-surround-change-line)", desc = "Change with new line" },
	{ surround_leader .. "d", "<Plug>(nvim-surround-delete)", desc = "Delete with new line" },

	{ mode = { "v" }, surround_leader .. "s", "<Plug>(nvim-surround-visual)", desc = "Normal" },
	{ mode = { "v" }, surround_leader .. "L", "<Plug>(nvim-surround-visual-line)", desc = "Normal with new line" },
	{ mode = { "i" }, surround_leader_insert .. "s", "<Plug>(nvim-surround-insert)", desc = "Normal" },
	{ mode = { "i" }, surround_leader_insert .. "L", "<Plug>(nvim-surround-insert-line)", desc = "Normal with new line" },
})


---- fold
local folding_leader = require("rumman.lib.keys").fold.leaders.globals
which_key.add({
	{ folding_leader, group =  "Fold" },
	{ folding_leader .. "z", "zi", desc = "Toggle" },
	{ folding_leader .. "m", "zf", desc = "Make" },
	{ folding_leader .. "s", require("ufo").peekFoldedLinesUnderCursor, desc = "Show" },

	{ "[z", "zo", desc = "Open fold" },
	{ "]z", "zc", desc = "Close fold" },

	loop_keymaps( folding_leader .. "t", true, folding_leader .. "ti", "za", { desc = "In" }),
	loop_keymaps( folding_leader .. "t", true, folding_leader .. "to", "zA", { desc = "Out" }),

	loop_keymaps( folding_leader .. "o", true, folding_leader .. "oi", "zo", { desc = "In" }),
	loop_keymaps( folding_leader .. "o", true, folding_leader .. "oo", "zO", { desc = "Out" }),
	loop_keymaps( folding_leader .. "o", true, folding_leader .. "oa", function() require("ufo").openAllFolds() end, { desc = "All" }),
	loop_keymaps( folding_leader .. "o", true, folding_leader .. "ok", require("ufo").openFoldsExceptKinds, { desc = "Except kinds" }),

	loop_keymaps( folding_leader .. "c", true, folding_leader .. "ci", "zc", { desc = "In" }),
	loop_keymaps( folding_leader .. "c", true, folding_leader .. "co", "zC", { desc = "Out" }),
	loop_keymaps( folding_leader .. "c", true, folding_leader .. "ca", function() require("ufo").closeAllFolds() end, { desc = "All" }),
	loop_keymaps( folding_leader .. "c", true, folding_leader .. "cw", require("ufo").closeFoldsWith, { desc = "Folds with" }),

	loop_keymaps( folding_leader .. "d", true, folding_leader .. "di", "zd", { desc = "In" }),
	loop_keymaps( folding_leader .. "d", true, folding_leader .. "do", "zD", { desc = "Out" }),
	loop_keymaps( folding_leader .. "d", true, folding_leader .. "da", "zE", { desc = "All" }),

	loop_keymaps( folding_leader .. "f", true, folding_leader .. "fm", "zm", { desc = "More" }),
	loop_keymaps( folding_leader .. "f", true, folding_leader .. "fm", "zm", { desc = "More" }),

})

---- auto-session
local session_leader = require("rumman.lib.keys").session.leaders.globals
which_key.add({
	{ session_leader, desc = "Session"},
	{ session_leader .. "s", "<cmd>SessionSave<cr>", desc = "Save" },
	{ session_leader .. "r", "<cmd>SessionRestorecr>", desc = "Restore" },
	{ session_leader .. "S", "<cmd>SessionSearch<cr>", desc = "Search" },
	{ session_leader .. "d", "<cmd>SessionDelete<cr>", desc = "Delete" },
	{ session_leader .. "t", "<cmd>SessionToggleAutoSave<cr>", desc = "Toggle(autosave)" },
	{ session_leader .. "d", "<cmd>SessionDisableAutoSave<cr>", desc = "Disable(autosave)" },
})

---- flash
local flash_leader = require("rumman.lib.keys").flash.leaders.globals
which_key.add({
	{ mode = { "n", "x", "o" }, "f", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true } }) end },
	{ mode = { "n", "x", "o" }, "F", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true } }) end },
	{ mode = { "n", "x", "o" }, "t", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }, jump = { offset = -1 } }) end },
	{ mode = { "n", "x", "o" }, "T", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }, jump = { offset = 1 } }) end },
	{ mode = "c", "<c-s>", function() require("flash").toggle() end },

	{ flash_leader, group = "Search" },
	{ flash_leader .. "h", "<cmd>Telescope search_history<cr>", desc = "Search history" },
	{ flash_leader .. "x", "<cmd> nohlsearch <cr>", desc = "Clear search" },
	{ flash_leader .. "r", ":%s/", desc = "Replace" },
	{ flash_leader .. "r", ":s/", desc = "Replace", mode = { "v", "x" } },
	{ flash_leader .. "R", "<cmd>GrugFar<cr>", desc = "Replace in all files", mode = { "n", "v" } },
	{ flash_leader .. "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump", },
	{ flash_leader .. "t", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Treesitter", },
	{ flash_leader .. "J", mode = { "o" }, function() require("flash").remote() end, desc = "Remote Flash", },
	{ flash_leader .. "T", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
	{ flash_leader .. "l", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^", highlight = { backdrop = false }, }) end, desc = "Line", mode = { "n", "x", "o" }, },
	{ flash_leader .. "c", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Cursor", mode = { "n", "x", "o" }, },
	{ flash_leader .. "w", function() require("flash").jump({ search = { mode = function(pattern) return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern) end, }, jump = { pos = "range" }, }) end, desc = "Word", mode = { "n", "x", "o" }, },
})


---- gitsigns
local git_leader = require("rumman.lib.keys").git.leaders.globals
which_key.add({
	{ git_leader, group = "Git" },
	{ git_leader .. "a", group = "Add(Stage)" },
	{ git_leader .. "l", group = "List" },
	{ git_leader .. "f", group = "Find" },
	{ git_leader .. "u", group = "Undo" },
	{ git_leader .. "h", group = "Hunk" },
	{ git_leader .. "d", group = "Diff" },
	{ git_leader .. "b", group = "Blame" },
	{ git_leader .. "t", group = "Toggle" },
	{ git_leader .. "B", group = "Base" },
	{ git_leader .. "R", group = "Reset" },

	{ git_leader .. "fc", "<cmd>Telescope git_commits<cr>", desc = "All commits" },
	{ git_leader .. "fC", "<cmd>Telescope git_bcommits<cr>", desc = "Buffer commits" },
	{ git_leader .. "fs", "<cmd>Telescope git_status<cr>", desc = "Status" },
	{ git_leader .. "fb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
	{ git_leader .. "ff", "<cmd>Telescope git_files<cr>", desc = "Files" },
	{ git_leader .. "fS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
	{ git_leader .. "fx", "<cmd>Telescope conflicts<cr>", desc = "Conflicts" },

	{ git_leader .. "S", "<cmd>Gitsigns show<cr>", desc = "Show" },
	{ git_leader .. "r", "<cmd>Gitsigns refresh<cr>", desc = "Refresh" },
	{ git_leader .. "G", "<cmd>Gitsigns get_actions<cr>", desc = "Get actions" },
	{ git_leader .. "ab", "<cmd>Gitsigns stage_buffer<cr>", desc = "Buffer" },
	{ git_leader .. "dw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Word" },

	loop_keymaps( git_leader, true, git_leader .. "n", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next" }),
	loop_keymaps( git_leader, true, git_leader .. "p", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous" }),

	loop_keymaps( git_leader .. "h", true, git_leader .. "ha", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Add(Stage)" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview inline" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hP", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hs", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hg", "<cmd>Gitsigns get_hunks<cr>", { desc = "Get" }),
	loop_keymaps( git_leader .. "h", true, git_leader .. "hv", "<cmd>Gitsigns nav_hunk<cr>", { desc = "Navigate" }),

	loop_keymaps(git_leader .. "d", true, git_leader .. "dh", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd L") end, { desc = "Left" }),
	loop_keymaps(git_leader .. "d", true, git_leader .. "dj", function() vim.cmd("Gitsigns diffthis") vim.cmd("wincmd K") end, { desc = "Down" }),
	loop_keymaps(git_leader .. "d", true, git_leader .. "dk", function() vim.cmd("set nosplitbelow") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd J") end, { desc = "Up" }),
	loop_keymaps(git_leader .. "d", true, git_leader .. "dl", function() vim.cmd("set splitright") vim.cmd("Gitsigns diffthis") vim.cmd("wincmd H") end, { desc = "Right" }),

	loop_keymaps( git_leader .. "b", true, git_leader .. "bc", "<cmd>Gitsigns blame_line<cr>", { desc = "Current line" }),
	loop_keymaps( git_leader .. "b", true, git_leader .. "be", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Every line" }),
	loop_keymaps( git_leader .. "b", true, git_leader .. "bs", "<cmd>Gitsigns blame<cr>", { desc = "Split view" }),

	{ git_leader .. "ts", "<cmd>Gitsigns toggle_signs<cr>", desc = "Signs" },
	{ git_leader .. "tl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Line highlight" },
	{ git_leader .. "tn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Number highlight" },
	{ git_leader .. "td", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Delete highlight" },

	{ git_leader .. "Bc", "<cmd>Gitsigns change_base<cr>", desc = "Change" },
	{ git_leader .. "Br", "<cmd>Gitsigns reset_base<cr>", desc = "Reset" },

	{ git_leader .. "Ri", "<cmd>Gitsigns reset_buffer_index<cr>", desc = "Buffer index" },
	{ git_leader .. "Rb", "<cmd>Gitsigns reset_buffer<cr>", desc = "Buffer" },

	{ git_leader .. "ll", "<cmd>Gitsigns setloclist<cr>", desc = "Loclist" },
	{ git_leader .. "lq", "<cmd>Gitsigns setqflist<cr>", desc = "Qflist" },
})

---- lazygit
local lazygit_leader = require("rumman.lib.keys").lazygit.leaders.globals
which_key.add({
	{ lazygit_leader, "<cmd>LazyGit<cr>", desc = "Lazygit" },
})

---- neotree
local neotree_leader = require("rumman.lib.keys").neotree.leaders.globals
local neotree_local_leader = require("rumman.lib.keys").neotree.leaders.locals
local reveal_cwd = function (is_enabled, is_leave_dir_opened)
	local config = require("neo-tree").config or {}

	-- Ensure filesystem table exists
	config.filesystem = config.filesystem or {}

	config.filesystem.follow_current_file = {
		enabled = is_enabled,
		leave_dirs_open = is_leave_dir_opened,
	}

	-- Reapply the updated configuration
	require("neo-tree").setup(config)

	-- Notify the user
	if is_enabled and is_leave_dir_opened then
		vim.notify("Neotree: Reveal current file enabled,\n(Leave directory opened)")
	elseif is_enabled and not is_leave_dir_opened then
		vim.notify("Neotree: Reveal current file enabled,\n(Leave directory closed)")
	else
		vim.notify("Neotree: Reveal current file disabled")
	end

	vim.cmd("Neotree close")
	vim.cmd("Neotree")
end

which_key.add({
	{ neotree_leader, group = "Explorer" },
	{ neotree_leader .. "m", group = "Move" },
	{ neotree_leader .. "r", group = "Reveal current" },

	{ neotree_leader .. "f", "<cmd>Neotree focus<cr>", desc = "Focus" },
	{ neotree_leader .. "x", "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>", desc = "Close" },

	{ neotree_leader .. "rx", function() reveal_cwd(false, false) end, desc = "Off" },
	{ neotree_leader .. "ro", function() reveal_cwd(true, true) end, desc = "Leave files opened" },
	{ neotree_leader .. "rc", function() reveal_cwd(true, false) end, desc = "Leave files closed" },

	{ neotree_leader .. "e", "<cmd>Neotree toggle<cr>", desc = "Toggle" },
	loop_keymaps( neotree_leader, true, neotree_leader .. "g", "<cmd>Neotree git_status<cr>", { desc = "Git explorer" } ),
	loop_keymaps( neotree_leader, true, neotree_leader .. "b", "<cmd>Neotree buffers<cr>", { desc = "Buffers explorer" }),
	loop_keymaps( neotree_leader .. "m", true, neotree_leader .. "mh", "<cmd>Neotree left<cr>", { desc = "Left" }),
	loop_keymaps( neotree_leader .. "m", true, neotree_leader .. "mk", "<cmd>Neotree top<cr>", { desc = "Up" }),
	loop_keymaps( neotree_leader .. "m", true, neotree_leader .. "ml", "<cmd>Neotree right<cr>", { desc = "Right" }),
	loop_keymaps( neotree_leader .. "m", true, neotree_leader .. "mj", "<cmd>Neotree bottom<cr>", { desc = "Down" }),
	loop_keymaps( neotree_leader .. "m", true, neotree_leader .. "mf", "<cmd>Neotree focus float<cr>", { desc = "Float" }),
	loop_keymaps( neotree_leader, true, neotree_leader .. "c", "<cmd>Neotree reveal<cr>", { desc = "Reveal Current" }),
})


-- neotree local keys
local function neotree_inside_keys(buf)
	return {
		buffer = buf,
		{ neotree_local_leader, group = "Explorer" },
		{ neotree_local_leader .. "c", desc = "Close" },
		{ neotree_local_leader .. "d", desc = "Directory" },
		{ neotree_local_leader .. "f", desc = "Files" },
		{ neotree_local_leader .. "fo", desc = "Opens" },
		{ neotree_local_leader .. "fop", desc = "Picker" },
		{ neotree_local_leader .. "fot", desc = "Tabs" },
		{ neotree_local_leader .. "fp", desc = "Preview" },
		{ neotree_local_leader .. "g", desc = "Git" },
		{ neotree_local_leader .. "o", desc = "Order by" },
	}
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(n)
		local filetype = vim.bo[n.buf].filetype
		if filetype == "neo-tree" then
			which_key.add(neotree_inside_keys(n.buf))
		end
	end
})

---- spider
which_key.add({
	{ mode = { "n", "o", "x" }, "w", function() require('spider').motion('w') end, desc = "Spider-w" },
	{ mode = { "n", "o", "x" }, "e", function() require('spider').motion('e') end, desc = "Spider-e" },
	{ mode = { "n", "o", "x" }, "b", function() require('spider').motion('b') end, desc = "Spider-b" },
	{ mode = { 'n', 'o', 'x' }, "ge", function() require('spider').motion('ge') end, desc = "Spider-ge" },
})

---- telescope
-- normal keymaps
local telescope_leader = require("rumman.lib.keys").telescope.leaders.globals
local telescope_local_leader = require("rumman.lib.keys").telescope.leaders.locals
which_key.add({
	{ mode = { "c" }, "<c-h>", "<cmd>Telescope command_history<cr>", desc = "Command history" },

	{ telescope_leader, desc = "Find" },
	{ telescope_leader .. "a", "<cmd>Telescope builtin<cr>", desc = "All" },
	{ telescope_leader .. "c", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current" },
	{ telescope_leader .. "C", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{ telescope_leader .. "f", "<cmd>Telescope find_files<cr>", desc = "Files" },
	{ telescope_leader .. "F", "<cmd>Telescope resume<cr>", desc = "Resume" },
	{ telescope_leader .. "h", "<cmd>Telescope help_tags<cr>", desc = "Helps" },
	{ telescope_leader .. "o", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
	{ telescope_leader .. "r", "<cmd>Telescope registers<cr>", desc = "Registers" },
	{ telescope_leader .. "u", "<cmd>Telescope undo<cr>", desc = "Undo" },
	{ telescope_leader .. "w", "<cmd>Telescope live_grep<cr>", desc = "Words" },
	{ telescope_leader .. "n", "<cmd>Telescope noice<cr>", desc = "Noice" },
	{ telescope_leader .. "s", "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggest" },
	{ telescope_leader .. "l", "<cmd>Telescope loclist<cr>", desc = "Loclist" },
	{ telescope_leader .. "q", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
	{ telescope_leader .. "z", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
})

-- local keymaps
local function telescope_local_keys(buf)
	return {
		buffer = buf,
		{ telescope_local_leader, desc = "Telescope" },
		{ telescope_local_leader .. "f", desc = "File" },
		{ telescope_local_leader .. "fo", desc = "Open" },
		{ telescope_local_leader .. "foh", desc = "Left" },
		{ telescope_local_leader .. "foj", desc = "Down" },
		{ telescope_local_leader .. "fok", desc = "Up" },
		{ telescope_local_leader .. "fol", desc = "Right" },
		{ telescope_local_leader .. "fot", desc = "As Tab" },

		{ telescope_local_leader .. "a", desc = "Add" },
		{ telescope_local_leader .. "aa", desc = "All" },
		{ telescope_local_leader .. "as", desc = "Selected" },

		{ telescope_local_leader .. "<tab>", desc = "Select & up" },
		{ telescope_local_leader .. "<s-tab>", desc = "Select & down" },
		{ telescope_local_leader .. "<cr>", desc = "Enter" },
		{ telescope_local_leader .. "<esc>", desc = "Quit" },
	}
end

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function(e)
		local current_filetype = vim.bo[e.buf].filetype

		if current_filetype == "TelescopePrompt" then
			which_key.add(telescope_local_keys(e.buf))
		end
	end,
})


---- toggleterm
local toggleterm_leader = require("rumman.lib.keys").toggleterm.leaders.globals
vim.keymap.set("n", "<c-\\>", '<cmd>exe v:count1 . "ToggleTerm"<cr>', {desc = "counted toggleterm"})
which_key.add({
	{ toggleterm_leader, group = "Terminal" },
	{ toggleterm_leader .. "o", group = "Open" },
	{ toggleterm_leader .. "on", group = "Named" },
	{ toggleterm_leader .. "oc", group = "Counted" },
	{ toggleterm_leader .. "t", "<cmd>ToggleTerm<cr><c-w>=", desc = "Toggle" },


	loop_keymaps( toggleterm_leader .. "o", true, toggleterm_leader .. "oj", "<cmd>ToggleTerm direction=horizontal<cr><cmd>wincmd J<cr>", { desc = "Down" }),
	loop_keymaps( toggleterm_leader .. "o", true, toggleterm_leader .. "ol", "<cmd>ToggleTerm direction=vertical<cr><cmd>wincmd L<cr>", { desc = "Right" }),
	loop_keymaps( toggleterm_leader .. "o", true, toggleterm_leader .. "of", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" }),
	loop_keymaps( toggleterm_leader .. "o", true, toggleterm_leader .. "ot", "<cmd>ToggleTerm direction=tab<cr>", { desc = "As tab" }),

	{ toggleterm_leader .. "ocl", function()
		local count = tonumber(vim.fn.input("Count: ")) or 1
		for i = 1, count do
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i) .. "<cmd>exe v:count1 . 'ToggleTerm direction=vertical'<cr><c-w>=", true, false, true), "n", false)
		end
	end, desc = "Left" },
	{ toggleterm_leader .. "ocj", function()
		local count = tonumber(vim.fn.input("Count: ")) or 1
		for i = 1, count do
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i) .. "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<cr><c-w>=", true, false, true), "n", false)
		end
	end, desc = "Down" },

	loop_keymaps( toggleterm_leader .. "on", true, toggleterm_leader .. "onj", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("ToggleTerm direction=horizontal name=" .. char)
			vim.cmd("wincmd J")
		else
			vim.notify("No name inserted")
		end
	end, { desc = "Down" }),
	loop_keymaps( toggleterm_leader .. "on", true, toggleterm_leader .. "onl", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("ToggleTerm direction=vertical name=" .. char)
			vim.cmd("wincmd L")
		else
			vim.notify("No name inserted")
		end
	end, { desc = "Right" }),
	loop_keymaps( toggleterm_leader .. "on", true, toggleterm_leader .. "onf", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("ToggleTerm direction=float name=" .. char)
		else
			vim.notify("No name inserted")
		end
	end, { desc = "Float" }),
	loop_keymaps( toggleterm_leader .. "on", true, toggleterm_leader .. "ont", function ()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("ToggleTerm direction=tab name=" .. char)
		else
			vim.notify("No name inserted")
		end
	end, { desc = "Tab" }),
})

---- undotree
local undotree_leader = require("rumman.lib.keys").undotree.leaders.globals
local undotree_local_leader = require("rumman.lib.keys").undotree.leaders.globals
local function undotree_window(undotree, diffpanel)
	vim.g.undotree_CustomUndotreeCmd = undotree
	vim.g.undotree_CustomDiffpanelCmd = diffpanel
	vim.cmd("UndotreeToggle")
	vim.cmd("UndotreeShow")
end

which_key.add({
	{ undotree_leader, group = "Undotree" },
	{ undotree_leader .. "m", group = "Move" },
	{ undotree_leader .. "f", "<cmd>UndotreeShow<cr><cmd>UndotreeFocus<cr>", desc = "Focus" },
	{ undotree_leader .. "x", "<cmd>UndotreeHide<cr>", desc = "Close" },
	loop_keymaps( undotree_leader, true, undotree_leader .. "u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle" } ),

	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mh", function ()
		undotree_window("topleft vertical 30 new", "rightbelow new" )
	end, { desc = "Left" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "ml", function ()
		undotree_window("botright vertical 30 new", "rightbelow new" )
	end, { desc = "Right" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mk", function ()
		undotree_window("leftabove horizontal 10 new", "rightbelow vertical new")
	end, { desc = "Up" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mj", function ()
		undotree_window("botright horizontal 10 new", "rightbelow vertical new")
	end, { desc = "Down" }),

	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mH", function ()
		undotree_window("topleft vertical 30 new", "botright 10 new")
	end, { desc = "Left + Down" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mJ", function ()
		undotree_window("rightbelow vertical 30 new", "botright 10 new")
	end, { desc = "Right + Down" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mK", function ()
		undotree_window("belowright vertical 30 new", "topleft 10 new")
	end, { desc = "Right + Up" }),
	loop_keymaps( undotree_leader .. "m", true, undotree_leader .. "mL", function ()
		undotree_window("topleft vertical 30 new", "topleft 10 new")
	end, { desc = "Left + Up" }),
})

-- undotree local keys
local function undotree_inside_keys(buf)
	return {
		buffer = buf,
		{ undotree_local_leader, group = "Undotree" },
		{ undotree_local_leader .. "x", "<plug>UndotreeClose", desc = "Close" },
		{ undotree_local_leader .. "u", "<Plug>UndotreeUndo", desc = "Undo" },
		{ undotree_local_leader .. "r", "<Plug>UndotreeRedo", desc = "Redo" },

		{ undotree_local_leader .. "f", "<Plug>UndotreeFocusTarget", desc = "Focus target" },
		{ undotree_local_leader .. "c", "<Plug>UndotreeClearHistory", desc = "Clear history" },
		{ undotree_local_leader .. "t", "<Plug>UndotreeTimestampToggle", desc = "Timestamp" },
		{ undotree_local_leader .. "d", "<Plug>UndotreeDiffToggle", desc = "Diff" },
		{ undotree_local_leader .. "K", "<Plug>UndotreeNextState", desc = "Next" },
		{ undotree_local_leader .. "J", "<Plug>UndotreePreviousState", desc = "Previous" },
		{ undotree_local_leader .. "s", "<Plug>UndotreeNextSavedState", desc = "Next saved" },
		{ undotree_local_leader .. "S", "<Plug>UndotreePreviousSavedState", desc = "Previous saved" },
		{ undotree_local_leader .. "<cr>", "<Plug>UndotreeEnter", desc = "Enter" },
	}
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(n)
		local filetype = vim.bo[n.buf].filetype
		if filetype == "undotree" then
			which_key.add(undotree_inside_keys(n.buf))
		end
	end
})

---- windows
local windows_leader = require("rumman.lib.keys").windows.leaders.globals
which_key.add({
	{ mode = { "n", "t" }, "<c-h>", function() require("smart-splits").move_cursor_left() end },
	{ mode = { "n", "t" }, "<c-j>", function() require("smart-splits").move_cursor_down() end },
	{ mode = { "n", "t" }, "<c-k>", function() require("smart-splits").move_cursor_up() end },
	{ mode = { "n", "t" }, "<c-l>", function() require("smart-splits").move_cursor_right() end },
	{ mode = { "n", "t" }, "<c-p>", function() require("smart-splits").move_cursor_previous() end },

	{ windows_leader, group = "Window" },

	{ windows_leader .. "o", group = "Open" },
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "oj", "<cmd>set nosplitbelow<bar>split<cr>", { desc = "Down" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "ok", "<cmd>set splitbelow<bar>split<cr>", { desc = "Up" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "oh", "<cmd>set splitbelow<bar>vsplit<cr>", { desc = "Left" } ),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "ol", "<cmd>set nosplitbelow<bar>vsplit<cr>", { desc = "Right" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "ot", "<c-w>T", { desc = "As tab" }),

	loop_keymaps( windows_leader .. "o", true, windows_leader .. "o<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "o<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "o<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "o<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
	loop_keymaps( windows_leader .. "o", true, windows_leader .. "o<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

	{ windows_leader .. "x", group = "Close" },
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xc", "<c-w>c", { desc = "Current" } ),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xh", "<c-w>h<c-w>c", { desc = "Left", nowait = true  }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xj", "<c-w>j<c-w>c", { desc = "Down", nowait = true }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xk", "<c-w>k<c-w>c", { desc = "Up", nowait = true  }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xl", "<c-w>l<c-w>c", { desc = "Right", nowait = true  }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "xo", "<c-w>o", { desc = "Others" }),

	loop_keymaps( windows_leader .. "x", true, windows_leader .. "x<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" } ),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "x<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "x<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "x<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
	loop_keymaps( windows_leader .. "x", true, windows_leader .. "x<c-l>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

	{ windows_leader .. "m", group = "Move" },
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "mj", "<cmd>wincmd J<cr>", { desc = "Most bottom" } ),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "mk", "<cmd>wincmd K<cr>", { desc = "Most up" }),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "mh", "<cmd>wincmd H<cr>", { desc = "Most left" }),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "ml", "<cmd>wincmd L<cr>", { desc = "Most right" }),

	loop_keymaps( windows_leader .. "m", true, windows_leader .. "m<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" } ),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "m<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "m<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "m<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
	loop_keymaps( windows_leader .. "m", true, windows_leader .. "m<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

	{ windows_leader .. "s", group = "Swap" },
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "sh", "<cmd>SmartSwapLeft<cr><c-w>h", { desc = "Left" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "sj", "<cmd>SmartSwapDown<cr><c-w>j", { desc = "Down" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "sk", "<cmd>SmartSwapUp<cr><c-w>k", { desc = "Up" } ),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "sl", "<cmd>SmartSwapRight<cr><c-w>l", { desc = "Right" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "ss", "<c-w>r", { desc = "Swap" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "sS", "<c-w>R", { desc = "Swap reverse" }),

	loop_keymaps( windows_leader .. "s", true, windows_leader .. "s<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Go Left" } ),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "s<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Go Down" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "s<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Go Up" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "s<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Go Right" }),
	loop_keymaps( windows_leader .. "s", true, windows_leader .. "s<c-p>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go Right" }),

	loop_keymaps( windows_leader, true, windows_leader .. "t", "<cmd>WindowsToggleAutowidth<cr>", { desc = "Toggle auto expand" }),

	{ windows_leader .. "r", group = "Resize" },
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "re", "<cmd>WindowsEqualize<cr>", { desc = "Equal" }),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rh", "<cmd>vertical resize -2<cr>", { desc = "Left" } ),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rj", "<cmd>resize -2<cr>", { desc = "Down" } ),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rk", "<cmd>resize +2<cr>", { desc = "Up" } ),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rl", "<cmd>vertical resize +2<cr>", { desc = "Right" } ),

	{ windows_leader .. "rm", group = "Maximize" },
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rmm", "<cmd>WindowsMaximize<cr>", { desc = "Maximize" }),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rmh", "<cmd>WindowsMaximizeHorizontally<cr>", { desc = "Maximize horizontal" }),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rml", "<cmd>WindowsMaximizeHorizontally<cr>", { desc = "Maximize horizontal" }),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rmj", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize vertical" }),
	loop_keymaps( windows_leader .. "r", true, windows_leader .. "rmk", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize vertical" }),

	-- { windows_leader .. "rr", function() require("smart-splits").start_resize_mode() end, desc = "Resize mode" },
})


---- bufferline
-- normal keymaps
local bufferline_leader = require("rumman.lib.keys").bufferline.leaders.globals
which_key.add({
	{ "<a-h>", "<cmd>BufferLineCyclePrev<cr>" },
	{ "<a-l>", "<cmd>BufferLineCycleNext<cr>" },

	{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
	{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer"},

	{ bufferline_leader, group = "Bufferline" },
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "<a-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "<a-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" }),
	loop_keymaps(bufferline_leader, true, bufferline_leader .. "P", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle pin" }),

	{ bufferline_leader .. "m", group = "Move" },
	loop_keymaps(bufferline_leader .. "m", true, bufferline_leader .. "m<a-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
	loop_keymaps(bufferline_leader .. "m", true, bufferline_leader .. "m<a-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
	loop_keymaps(bufferline_leader .. "m", true, bufferline_leader .. "mh", "<cmd>BufferLineMovePrev<cr>", { desc = "Previous" }),
	loop_keymaps(bufferline_leader .. "m", true, bufferline_leader .. "ml", "<cmd>BufferLineMoveNext<cr>", { desc = "Next" }),
	loop_keymaps(bufferline_leader .. "m", true, bufferline_leader .. "mt", "<cmd>ScopeMoveBuf<cr>", { desc = "To tab" }),

	{ bufferline_leader .. "p", group = "Pick" },
	loop_keymaps(bufferline_leader .. "p", false, bufferline_leader .. "po", function() vim.cmd("BufferLinePick") end, { desc = "Open" }),
	loop_keymaps(bufferline_leader .. "p", false, bufferline_leader .. "px", function() vim.cmd("BufferLinePickClose") end, { desc = "Close" }),

	{ bufferline_leader .. "s", group = "Sort" },
	loop_keymaps(bufferline_leader .. "s", true, bufferline_leader .. "st", "<cmd>BufferLineSortByTabs<cr>", { desc = "By tab" }),
	loop_keymaps(bufferline_leader .. "s", true, bufferline_leader .. "sd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "By directory" }),
	loop_keymaps(bufferline_leader .. "s", true, bufferline_leader .. "se", "<cmd>BufferLineSortByExtension<cr>", { desc = "By extension" }),
	loop_keymaps(bufferline_leader .. "s", true, bufferline_leader .. "sr", "<cmd>BufferLineSortByRelativeDirectory<cr>", { desc = "By relative directory" }),

	{ bufferline_leader .. "g", group = "Group" },
	loop_keymaps(bufferline_leader .. "g", true, bufferline_leader .. "gt", "<cmd>BufferLineGroupToggle<cr>", { desc = "Toggle" }),
	loop_keymaps(bufferline_leader .. "g", true, bufferline_leader .. "gd", "<cmd>BufferLineGroupClose<cr>", { desc = "Close" }),

	{ bufferline_leader .. "t", group = "Tabs" },
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "t<a-j>", "<cmd>tabnext<cr>", { desc = "Go previous" } ),
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "t<a-k>", "<cmd>tabprevious<cr>", { desc = "Go next" }),
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "to", "<cmd>tabnew<cr>", { desc = "Open" } ),
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "tn", function()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("tabnew")
			vim.cmd("BufferLineTabRename " .. char)
		else
			vim.notify("No name inserted")
		end
	end, { desc = "Open named" }),

	{ bufferline_leader .. "tr", function()
		local char = vim.fn.input("Name: ")
		if char ~= "" then
			vim.cmd("BufferLineTabRename " .. char)
		else
			vim.notify("No name inserted")
		end
	end, desc = "Rename" },
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "tf", "<cmd>tabfirst<cr>", { desc = "First" }),
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "tl", "<cmd>tabfirst<cr>", { desc = "Last" }),
	{ bufferline_leader .. "tL", "<cmd>tabs<cr>", desc = "List" },

	{ bufferline_leader .. "tx", group = "Close" },
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "txc", "<cmd>tabclose<cr>", { desc = "Current" }),
	loop_keymaps( bufferline_leader .. "t", true, bufferline_leader .. "txo", "<cmd>tabonly<cr>", { desc = "Others" }),
	{ bufferline_leader .. "x", group = "Close" },
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "x<a-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go previous" }),
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "x<a-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go next" }),
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "xc", "<cmd>bdelete<cr>", { desc = "Current" }),
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "xh", "<cmd>BufferLineCloseLeft<cr>", { desc = "All left" }),
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "xl", "<cmd>BufferLineCloseRight<cr>", { desc = "All right" }),
	loop_keymaps(bufferline_leader .. "x", true, bufferline_leader .. "xo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Others" }),

})

-- location / quickfix list
which_key.add({
	{ "<leader>x", group = "Loc/Quick list" },

	{ "[q", "<cmd>cprevious<cr>", desc = "Prev quickfix" },
	{ "]q", "<cmd>cnext<cr>", desc = "Next quickfix" },

	{ "<leader>xl", group = "Location list" },
	{ "<leader>xlo", "<cmd>lopen<cr>", desc = "Open" },
	{ "<leader>xlc", "<cmd>lclose<cr>", desc = "Locaticon List" },

	{ "<leader>xq", group = "Quickfix list" },
	{ "<leader>xqo", "<cmd>copen<cr>", desc = "Open" },
	{ "<leader>xqc", "<cmd>cclose<cr>", desc = "Quickfix List" },
})
