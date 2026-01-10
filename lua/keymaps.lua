-- Navigation Keymaps
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = "Move to the split window to the right" })
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = "Move to the split window to the left" })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = "Move to the split window to the top" })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = "Move to the split window to the bottom" })
vim.keymap.set('n', '<C-t>', ':tabnew<cr>')
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Splitting Keymaps
vim.keymap.set('n', '<C-\\>', ':vsplit<cr>', { desc = "Split window vertically" })
vim.keymap.set('n', '<C-\'>', ':split<cr>', { desc = "Split window vertically" })

-- Picker keymaps
vim.keymap.set('n', '<leader>sf', require("fzf-lua").files)
vim.keymap.set('n', '<leader>sg', require("fzf-lua").live_grep)
vim.keymap.set('n', '<leader>sr', require("fzf-lua").resume)
vim.keymap.set('n', '<leader><leader>', require("fzf-lua").buffers)
vim.keymap.set('n', '<leader>sh', require("fzf-lua").helptags)
vim.keymap.set('n', '<leader>ds', require("fzf-lua").lsp_document_symbols)
vim.keymap.set({ 'n', 'v' }, '<C-.>', require("fzf-lua").lsp_code_actions)
vim.keymap.set({ 'n', 'v' }, '<leader>/', require("fzf-lua").grep_curbuf)
vim.keymap.set({ 'n', 'v' }, '<leader>sw', require("fzf-lua").grep_cword)
vim.keymap.set({ 'n', 'v' }, '<leader>sm', require("fzf-lua").marks)
vim.keymap.set({ 'n', 'v' }, '<leader>gg', require("fzf-lua").git_diff)

-- Miscellaneous Plugin Keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>o', ":Oil<CR>")

-- LSP Config
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>bs', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format {
    async = true,
    formatting_options = {
      tabSize = 2,
      insertSpaces = true,
      trimTrailingWhitespace = true,
      insertFinalNewline = true
    }
  }
end)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Quickfix List Keymaps
vim.keymap.set('n', '<M-j>', ':cnext<cr>', { desc = "Next List Item" })
vim.keymap.set('n', '<M-k>', ':cprev<cr>', { desc = "Previous List Item" })
vim.keymap.set('n', '<M-c>', ':cclose<cr>', { desc = "Close List" })
vim.keymap.set('n', '<M-o>', ':copen<cr>', { desc = "Open List" })

-- Diffview Keymaps
vim.keymap.set('n', '<leader>fh', vim.cmd.DiffviewFileHistory)
vim.keymap.set('n', '<leader>dv', vim.cmd.DiffviewOpen)

-- Organize Imports
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end
vim.keymap.set("n", "<leader>oi", organize_imports, { desc = "Organize Imports" })
