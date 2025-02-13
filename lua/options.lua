vim.opt.number = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.scrolloff = 5
vim.opt.showtabline=2

vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to the split window to the right" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to the split window to the left" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to the split window to the top" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to the split window to the bottom" })
vim.keymap.set('n', '<C-\\>', ':vsplit<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<C-s>', ':split<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = "Move to the next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprev<cr>', { desc = "Move to the previous buffer" })
vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { desc = "Move to the previous buffer" })
vim.keymap.set('n', '<C-d>', "yyp", { desc = "Copy line down" })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-t>', ':tabnew<cr>')
vim.keymap.set('n', '<leader>.', ":tabn<cr>")
vim.keymap.set('n', '<leader>,', ":tabp<cr>")
