-- leader of the crew
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- the fancy stuff
vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.g.have_nerd_font = true
vim.opt.guicursor = ""

-- save my indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- reduce updatetime
vim.opt.updatetime = 50

-- recovery settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- enable git blame
vim.g.blamer_enabled = 1

-- Configure WSL clipboard integration
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
  cache_enabled = false
}

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- slimline filler
-- vim.opt.fillchars = {
--   stl = "─",
-- }

-- set global statusline
vim.opt.laststatus = 3

-- disable recording info below the statusline
-- vim.opt.shortmess:append('q')

-- nightfly ui tweeks
-- vim.g.nightflyCursorColor = true
-- vim.g.nightflyItalics = false
-- vim.g.nightflyVirtualTextColor = true
-- vim.g.nightflyWinSeparator = 2

-- vim.api.nvim_set_hl(0, "St_macroIcon", { bg = "#f7768e", fg = "#1a1b26" }) -- Adjust colors to match your theme
-- vim.api.nvim_set_hl(0, "St_macroText", { fg = "#f7768e", bg = "#323242" })
