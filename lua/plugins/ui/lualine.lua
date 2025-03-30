-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "BufReadPost",
--     opts = {
--       theme = "auto",
--       icons_enabled = true,
--       component_separators = { left = "", right = "" },
--       section_separators = { left = "", right = "" },
--       disabled_filetypes = {
--         statusline = {},
--         winbar = {},
--       },
--       ignore_focus = {},
--       always_divide_middle = true,
--       globalstatus = true,
--     },
--     config = function()
--       local colors = {
--         bg = "#161617",
--         fg = "#c9c7cd",
--         subtext1 = "#b4b1ba",
--         subtext2 = "#9f9ca6",
--         subtext3 = "#8b8693",
--         subtext4 = "#6c6874",
--         bg_dark = "#131314",
--         black = "#27272a",
--         red = "#ea83a5",
--         green = "#90b99f",
--         yellow = "#e6b99d",
--         purple = "#aca1cf",
--         magenta = "#e29eca",
--         orange = "#f5a191",
--         blue = "#92a2d5",
--         cyan = "#85b5ba",
--         bright_black = "#353539",
--         bright_red = "#f591b2",
--         bright_green = "#9dc6ac",
--         bright_yellow = "#f0c5a9",
--         bright_purple = "#b9aeda",
--         bright_magenta = "#ecaad6",
--         bright_orange = "#ffae9f",
--         bright_blue = "#a6b6e9",
--         bright_cyan = "#99c9ce",
--         gray0 = "#18181a",
--         gray1 = "#1b1b1c",
--         gray2 = "#2a2a2c",
--         gray3 = "#313134",
--         gray4 = "#3b3b3e",
--         -- Special
--         none = "NONE",
--       }
--
--       local modecolor = {
--         n = colors.red,
--         i = colors.cyan,
--         v = colors.purple,
--         [""] = colors.purple,
--         V = colors.red,
--         c = colors.yellow,
--         no = colors.red,
--         s = colors.yellow,
--         S = colors.yellow,
--         [""] = colors.yellow,
--         ic = colors.yellow,
--         R = colors.green,
--         Rv = colors.purple,
--         cv = colors.red,
--         ce = colors.red,
--         r = colors.cyan,
--         rm = colors.cyan,
--         ["r?"] = colors.cyan,
--         ["!"] = colors.red,
--         t = colors.bright_red,
--       }
--
--       local space = {
--         function()
--           return " "
--         end,
--         color = { bg = colors.bg_dark, fg = colors.blue },
--       }
--
--       local filename = {
--         "filename",
--         color = { bg = colors.blue, fg = colors.bg, gui = "bold" },
--         separator = { left = "", right = "" },
--       }
--
--       local filetype = {
--         "filetype",
--         icons_enabled = false,
--         color = { bg = colors.gray2, fg = colors.blue, gui = "italic,bold" },
--         separator = { left = "", right = "" },
--       }
--
--       local branch = {
--         "branch",
--         icon = "",
--         color = { bg = colors.green, fg = colors.bg, gui = "bold" },
--         separator = { left = "", right = "" },
--       }
--
--       local location = {
--         "location",
--         color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
--         separator = { left = "", right = "" },
--       }
--
--       local diff = {
--         "diff",
--         color = { bg = colors.gray2, fg = colors.bg, gui = "bold" },
--         separator = { left = "", right = "" },
--         symbols = { added = " ", modified = " ", removed = " " },
--
--         diff_color = {
--           added = { fg = colors.green },
--           modified = { fg = colors.yellow },
--           removed = { fg = colors.red },
--         },
--       }
--
--       local modes = {
--         "mode",
--         -- color = function()
--         --   local mode_color = modecolor
--         --   return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
--         -- end,
--         separator = { left = "", right = "" },
--       }
--
--       local function getLspName()
--         local bufnr = vim.api.nvim_get_current_buf()
--         local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
--         local buf_ft = vim.bo.filetype
--         if next(buf_clients) == nil then
--           return "  No servers"
--         end
--         local buf_client_names = {}
--
--         for _, client in pairs(buf_clients) do
--           if client.name ~= "null-ls" then
--             table.insert(buf_client_names, client.name)
--           end
--         end
--
--         local lint_s, lint = pcall(require, "lint")
--         if lint_s then
--           for ft_k, ft_v in pairs(lint.linters_by_ft) do
--             if type(ft_v) == "table" then
--               for _, linter in ipairs(ft_v) do
--                 if buf_ft == ft_k then
--                   table.insert(buf_client_names, linter)
--                 end
--               end
--             elseif type(ft_v) == "string" then
--               if buf_ft == ft_k then
--                 table.insert(buf_client_names, ft_v)
--               end
--             end
--           end
--         end
--
--         local ok, conform = pcall(require, "conform")
--         local formatters = table.concat(conform.list_formatters_for_buffer(), " ")
--         if ok then
--           for formatter in formatters:gmatch("%w+") do
--             if formatter then
--               table.insert(buf_client_names, formatter)
--             end
--           end
--         end
--
--         local hash = {}
--         local unique_client_names = {}
--
--         for _, v in ipairs(buf_client_names) do
--           if not hash[v] then
--             unique_client_names[#unique_client_names + 1] = v
--             hash[v] = true
--           end
--         end
--         local language_servers = table.concat(unique_client_names, ", ")
--
--         return "  " .. language_servers
--       end
--
--       -- local macro = {
--       --   require("noice").api.status.mode.get,
--       --   cond = require("noice").api.status.mode.has,
--       --   color = { fg = colors.red, bg = colors.bg_dark, gui = "italic,bold" },
--       -- }
--
--       local dia = {
--         "diagnostics",
--         sources = { "nvim_diagnostic" },
--         symbols = { error = " ", warn = " ", info = " ", hint = " " },
--         diagnostics_color = {
--           error = { fg = colors.red },
--           warn = { fg = colors.yellow },
--           info = { fg = colors.purple },
--           hint = { fg = colors.cyan },
--         },
--         color = { bg = colors.gray2, fg = colors.blue, gui = "bold" },
--         separator = { left = "" },
--       }
--
--       local lsp = {
--         function()
--           return getLspName()
--         end,
--         separator = { left = "", right = "" },
--         color = { bg = colors.purple, fg = colors.bg, gui = "italic,bold" },
--       }
--
--       require("lualine").setup({
--         options = {
--           theme = 'tokyonight',
--         },
--         sections = {
--           lualine_a = {
--             modes,
--           },
--           lualine_b = {
--             filename,
--             space,
--             branch,
--           },
--           lualine_c = {
--             filetype,
--             space,
--             diff,
--             space,
--             location,
--           },
--           lualine_x = {
--             "overseer",
--           },
--           -- lualine_y = { macro, space },
--           lualine_z = {
--             dia,
--             lsp,
--           },
--         },
--         inactive_sections = {
--           lualine_a = {},
--           lualine_b = {},
--           lualine_c = { "filename" },
--           lualine_x = { "location" },
--           lualine_y = {},
--           lualine_z = {},
--         },
--       })
--     end,
--   },
-- }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return '  ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local filename = {
      'filename',
      path = 0,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      file_status = false, -- displays file status (readonly status, modified status)
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰛨 ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        globalstatus = true,
        theme = 'tokyonight',
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { mode },
        -- lualine_b = { { 'branch', icons_enabled = true, icon = '' } },
        lualine_b = { { 'branch', icons_enabled = true, icon = ' ' } },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        -- extensions = { 'vim-fugitive' },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
