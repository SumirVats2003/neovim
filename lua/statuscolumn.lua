local function mark_at_line()
  local lnum = vim.v.lnum
  local buf = vim.api.nvim_get_current_buf()

  for _, mark in ipairs(vim.fn.getmarklist(buf)) do
    local mark_lnum = mark.pos[2]
    local m = mark.mark:sub(2, 2)
    if mark_lnum == lnum and m:match("%a") then
      return "%#StatusColMark#" .. m .. "%*"
    end
  end

  return ""
end

local diag_icons = {
  [vim.diagnostic.severity.ERROR] = { icon = "", hl = "StatusColError" },
  [vim.diagnostic.severity.WARN]  = { icon = "", hl = "StatusColWarn" },
  [vim.diagnostic.severity.INFO]  = { icon = "", hl = "StatusColInfo" },
  [vim.diagnostic.severity.HINT]  = { icon = "󰛨", hl = "StatusColHint" },
}

local function diagnostic_at_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum = vim.v.lnum - 1

  local diags = vim.diagnostic.get(bufnr, { lnum = lnum })
  if #diags == 0 then
    return ""
  end

  table.sort(diags, function(a, b)
    return a.severity < b.severity
  end)
  local d = diag_icons[diags[1].severity]
  return "%#" .. d.hl .. "#" .. d.icon .. "%*"
end

_G.statuscolumn_marks = mark_at_line
_G.statuscolumn_diagnostics = diagnostic_at_line

vim.api.nvim_set_hl(0, "StatusColMark",  { fg = "#7a84f7", bold = true })
vim.api.nvim_set_hl(0, "StatusColError", { fg = "#f7768e", bold = true })
vim.api.nvim_set_hl(0, "StatusColWarn",  { fg = "#e0af68", bold = true })
vim.api.nvim_set_hl(0, "StatusColInfo",  { fg = "#73daca", bold = true })
vim.api.nvim_set_hl(0, "StatusColHint",  { fg = "#08bdba", bold = true })

vim.opt.statuscolumn = "%{%v:lua.statuscolumn_marks()%}" ..
    "%{%v:lua.statuscolumn_diagnostics()%} " .. "%r " .. "%l " .. "%s"
