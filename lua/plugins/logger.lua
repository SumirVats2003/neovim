return {
  "Goose97/timber.nvim",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    local opts = {
      log_templates = {
        default = {
          javascript = [[console.log("%log_target:", %log_target)]],
          typescript = [[console.log("%log_target:", %log_target)]],
        }
      }
    }
    require("timber").setup(opts)
  end
}
