local keybind_functions = require("keymaps.functions")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--==================================================--
--                      cursor                      --
--==================================================--
map("n", "<c-h>", function() require("smart-splits").move_cursor_left() end, opts)
map("n", "<c-j>", function() require("smart-splits").move_cursor_down() end, opts)
map("n", "<c-k>", function() require("smart-splits").move_cursor_up() end, opts)
map("n", "<c-l>", function() require("smart-splits").move_cursor_right() end, opts)
map("n", "<c-p>", function() require("smart-splits").move_cursor_previous() end, opts)
--==================================================--
--                       copy                       --
--==================================================--
map({"v", "x"}, "<c-y>", '"+ygv <esc>h')
map("n", "<c-y>", '"+y')
map({"v", "x"}, "y", "ygv <esc>h" )
--==================================================--
--                   native fFtT                    --
--==================================================--
map({"n", "x", "o"}, "f", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }}) end, opts)
map({"n", "x", "o"}, "F", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }}) end, opts)
map({"n", "x", "o"}, "t", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }, jump = { offset = -1 }}) end, opts)
map({"n", "x", "o"}, "T", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }, jump = { offset = 1 }}) end, opts)
map("c", "<c-s>", function() require("flash").toggle() end, opts)
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
map( "i", "<c-h>", "<left>", opts )
map( "i", "<c-l>", "<right>", opts )
map( "i", "<c-k>", "<up>", opts )
map( "i", "<c-j>", "<down>", opts )
map( "i", "<c-s-k>", "<esc>O", opts )
map( "i", "<c-s-j>", "<esc>o", opts )
--==================================================--
--                       fix                        --
--==================================================--
map("n", "q", function () keybind_functions.handle_q_colon_key() end, opts)
map({ "v", "x" }, "p", '"_dP', opts)
map( "n", "x", '"_x', opts )
map( "n", "j", "gj", opts )
map( "n", "k", "gk", opts )
--==================================================--
--                     moveline                     --
--==================================================--
-- map("n", "", ":m .+1<cr>==", opts)
-- map("n", "", ":m .-2<cr>==", opts)
map({ "v", "x" }, "<a-k>", ":m '<-2<cr>gv=gv", opts )
map({ "v", "x" }, "<a-j>", ":m '>+1<cr>gv=gv", opts )
map({ "v", "x" }, "<a-h>", "<gv", opts )
map({ "v", "x" }, "<a-l>", ">gv", opts )
--==================================================--
--                      command                     --
--==================================================--
map( "c", "<c-h>", "<cmd>Telescope command_history<cr>", opts )
--==================================================--
--                       save                       --
--==================================================--
map({ "n", "i", "v", "x" }, "<c-q>", "<cmd>w<cr>", opts )
--==================================================--
--                 removed keybinds                 --
--==================================================--

