--[[ the purpose of this require globals file is reuse some similar icons,
variables in between all plugins ]]
require("globals")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.laststatus = 0
vim.opt.statusline = "%="
vim.opt.completeopt = COMPLETEOPT

require("lazy.lazy")
vim.cmd("colorscheme gruvbox")

