local M = {}

M.base46 = {
  theme = "bearded-arc"
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  cmp = { icons_left = true }
}

M.lsp = {
  signature = true,
}

return M
