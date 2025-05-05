local M = {}

M.base46 = {
  theme = "jabuti"
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    theme = "default",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "fmt", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      fmt = function()
        local reg = vim.fn.reg_recording()
        if reg ~= "" then
          local icon = "%#St_macroIcon#" .. " " .. " " .. " "
          local register = "%#St_macroText#" .. " @" .. reg .. " "
          return icon .. register
        end
        return nil
      end,
    }
  },
  cmp = { icons_left = true }
}

M.lsp = {
  signature = false,
}

return M
