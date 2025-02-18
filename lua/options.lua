vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
