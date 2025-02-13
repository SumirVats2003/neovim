return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      sources = {
        "filesystem",
        "buffers",
        "git_status"
      },
      source_selector = {
        winbar = false,
        statusline = false
      }
    })
    vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal right<CR>', {})
    vim.keymap.set('n', '<leader>m', ':Neotree toggle right<CR>', {})
  end
}
