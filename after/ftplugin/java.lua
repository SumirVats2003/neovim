vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format {
    async = true,
    formatting_options = {
      tabSize = 4,
      insertSpaces = true,
      trimTrailingWhitespace = true,
      insertFinalNewline = true
    }
  }
end)
