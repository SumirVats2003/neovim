return {
  "AstroNvim/astrotheme",
  config = function()
    require("astrotheme").setup({
      -- style = {
      --   transparent = true
      -- }
    })
    vim.cmd.colorscheme('astrodark')
  end
}
