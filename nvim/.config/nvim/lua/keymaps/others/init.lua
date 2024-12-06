-- ============================================================================
--[[ custom function for keymaps of q,
fix q key without breaking q macro recording ]]
local function handle_q_colon_key()
	--[[ when alreaddy recording, this vim.fn.reg_recording() this function returns
	recording register (ex: a/b/c..) & when not recording, it returns empty
	string (ex: '') ]]
	if vim.fn.reg_recording() == "" then
		--[[ when call that vim.fn.getcharstr() function, after calling this waiting
		for key press and returns the key ]]
		local key = vim.fn.getcharstr()

		-- if after pressing q, the key is ":" then leave function
		if key ~= ":" then
			--[[ if after pressing q, the key is "keys" then this vim.api.nvim_feedkeys()
			function will send the given "keys" to nvim, that is q + "keys" with normal
			mode which is starting recording macros (ex: qa) ]]
			vim.api.nvim_feedkeys("q" .. key, "n", true)

			-- this is for notify it to, is it recording or not, by vim notify
			for _, values in ipairs(ALPHA_KEYS) do
				if key == values then
					vim.notify("Recording macro to regkey: " .. key)
				end
			end
		end
	else
		-- this is for notify to when the current recording is stopped
		vim.notify("Stopped recording macro to regkey: " .. vim.fn.reg_recording())

		--[[ when already into recording, after pressing q is the given intput key
		also q, so that nvim can recognize as quit macro ]]
		vim.api.nvim_feedkeys("q", "n", true)
	end
end
-- ============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
--==================================================--
--                      cursor                      --
--==================================================--
map("n", "<c-h>", function()
	require("smart-splits").move_cursor_left()
end, opts)
map("n", "<c-j>", function()
	require("smart-splits").move_cursor_down()
end, opts)
map("n", "<c-k>", function()
	require("smart-splits").move_cursor_up()
end, opts)
map("n", "<c-l>", function()
	require("smart-splits").move_cursor_right()
end, opts)
map("n", "<c-p>", function()
	require("smart-splits").move_cursor_previous()
end, opts)
--==================================================--
--                       copy                       --
--==================================================--
map({ "v", "x" }, "<c-y>", '"+ygv <esc>h')
map("n", "<c-y>", '"+y')
map({ "v", "x" }, "y", "ygv <esc>h")
--==================================================--
--                   native fFtT                    --
--==================================================--
map({ "n", "x", "o" }, "f", function()
	require("flash").jump({ search = { forward = true, wrap = false, multi_window = true } })
end, opts)
map({ "n", "x", "o" }, "F", function()
	require("flash").jump({ search = { forward = false, wrap = false, multi_window = true } })
end, opts)
map({ "n", "x", "o" }, "t", function()
	require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }, jump = { offset = -1 } })
end, opts)
map({ "n", "x", "o" }, "T", function()
	require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }, jump = { offset = 1 } })
end, opts)
map("c", "<c-s>", function()
	require("flash").toggle()
end, opts)
--==================================================--
--                       tab                       --
--==================================================--
map("n", "<a-j>", "<cmd>tabnext<cr>")
map("n", "<a-k>", "<cmd>tabprevious<cr>")
--==================================================--
--                      buffer                       --
--==================================================--
-- map("n", "<a-h>", "<cmd>bprevious<cr>")
-- map("n", "<a-l>", "<cmd>bnext<cr>")
map("n", "<a-h>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<a-l>", "<cmd>BufferLineCycleNext<cr>")
--==================================================--
--             incremental/decremenal               --
--==================================================--
map("n", "+", "<c-a>", opts)
map("n", "-", "<c-x>", opts)
--==================================================--
--                  page movement                   --
--==================================================--
-- map("n", "n", "nzzzv", opts)
-- map("n", "N", "Nzzzv", opts)
-- map("n", "<c-u>", "<c-u>zz0", opts)
-- map("n", "<c-d>", "<c-d>zz0", opts)
-- map("n", "<c-f>", "<c-f>zz0", opts)
-- map("n", "<c-b>", "<c-b>zz0", opts)
--==================================================--
--                   indentation                    --
--==================================================--
map({ "v", "x" }, "<", "<gv", opts)
map({ "v", "x" }, ">", ">gv", opts)
--==================================================--
--                 cursor movement                  --
--==================================================--
map("i", "<c-h>", "<left>", opts)
map("i", "<c-l>", "<right>", opts)
map("i", "<c-k>", "<up>", opts)
map("i", "<c-j>", "<down>", opts)
map("i", "<c-s-k>", "<esc>O", opts)
map("i", "<c-s-j>", "<esc>o", opts)
--==================================================--
--                       fix                        --
--==================================================--
map("n", "q", handle_q_colon_key, opts)
map({ "v", "x" }, "p", '"_dP', opts)
map("n", "x", '"_x', opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
--==================================================--
--                     moveline                     --
--==================================================--
-- map("n", "", ":m .+1<cr>==", opts)
-- map("n", "", ":m .-2<cr>==", opts)
map({ "v", "x" }, "<a-k>", ":m '<-2<cr>gv=gv", opts)
map({ "v", "x" }, "<a-j>", ":m '>+1<cr>gv=gv", opts)
map({ "v", "x" }, "<a-h>", "<gv", opts)
map({ "v", "x" }, "<a-l>", ">gv", opts)
--==================================================--
--                      command                     --
--==================================================--
map("c", "<c-h>", "<cmd>Telescope command_history<cr>", opts)
--==================================================--
--                 removed keybinds                 --
--==================================================--

