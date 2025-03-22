return {
  "folke/tokyonight.nvim",
  config = function()
    require('tokyonight').setup({
      options = {
      }
    })
    vim.cmd.colorscheme('tokyonight-night')
  end
}
