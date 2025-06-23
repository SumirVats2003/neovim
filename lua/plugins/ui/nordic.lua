return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').setup({
      transparent = {
        bg = true
      },
      cursorline = {
        bold = false,
        bold_number = true,
        theme = 'dark',
        blend = 0.1,
      },
      bright_border = false,
      bold_keywords = true,
    })
    require('nordic').load()
  end
}
