return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      highlights = {
        tab_selected = {
          bg = '#3d59a1',
          fg = '#a9b1d6'
        },
        separator = {
          fg = '#434C5E',
        },
        buffer_selected = {
          bold = true,
          italic = true,
          -- bg = '#3d59a1',
          -- fg = '#a9b1d6'
        },
        fill = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
          guifg = { attribute = "fg", highlight = "TabLine" },
          guibg = { attribute = "bg", highlight = "TabLine" },
        },
        -- separator_selected = {},
        -- tab_selected = {},
        -- background = {},
        -- indicator_selected = {},
        -- fill = {},
      },
    })
  end
}
