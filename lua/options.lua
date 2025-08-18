-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- quality of life
vim.o.nu = true
vim.o.tabstop = 2

-- indentation
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- visual settings
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.laststatus = 3
vim.g.have_nerd_font = true
vim.o.winborder = "rounded"
vim.g.blamer_enabled = 1
vim.o.wrap = false

-- swap and undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

-- split settings
vim.o.splitright = true
vim.o.splitbelow = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.cmd [[colorscheme tokyonight-night]]

vim.lsp.enable({ "lua_ls", "gopls", "angularls", "ts_ls", "html", "css" })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
      hint_prefix = ""
    }, bufnr)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end
vim.keymap.set("n", "<leader>oi", organize_imports, { desc = "Organize Imports" })
