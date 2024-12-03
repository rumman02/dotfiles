vim.opt.colorcolumn = "80"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.laststatus = 0
vim.opt.statusline = "%="

require("lazy.lazy")
vim.cmd("colorscheme gruvbox")

