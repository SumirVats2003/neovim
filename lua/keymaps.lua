-- split window navigation
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to the split window to the right" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to the split window to the left" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to the split window to the top" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to the split window to the bottom" })

-- split window
vim.keymap.set('n', '<C-\\>', ':vsplit<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<C-s>', ':split<cr>', { desc = "Split window vertically" })

-- buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = "Move to the next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprev<cr>', { desc = "Move to the previous buffer" })
vim.keymap.set('n', '<C-t>', ':tabnew<cr>')
vim.keymap.set('n', '<leader>.', ":tabn<cr>")
vim.keymap.set('n', '<leader>,', ":tabp<cr>")

-- lazy
vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { desc = "Move to the previous buffer" })

-- misc bindings
vim.keymap.set('n', '<C-d>', "yyp", { desc = "Copy line down" })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- thanks to ThePrimeagen
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

