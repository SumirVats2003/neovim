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
      separator = { left = "", right = "" },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰛨 ' },
      colored = true,
      update_in_insert = true,
      always_visible = false,
      separator = { left = "", right = "" },
      cond = hide_in_width,
    }

    -- local space = {
    --   function()
    --     return " "
    --   end,
    -- }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      separator = { left = "", right = "" },
      color = { bg = "#16161e", fg = "", gui = "bold" },
    }

    require('lualine').setup {
      options = {
        globalstatus = true,
        theme = 'rose-pine',
        icons_enabled = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {
          {
            'branch',
            icons_enabled = true,
            icon = '',
            separator = { left = "", right = "" },
          },
          -- {
          --   'filename',
          --   symbols = {
          --     modified = '',
          --   },
          --   color = { bg = "#2a2d36", fg = "", gui = "bold" },
          --   separator = { left = "", right = "" },
          -- }
        },
        lualine_c = {
          {
            'macro',
            fmt = function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return " @" .. reg
              end
              return nil
            end,
            color = { bg = "#08bdba", fg = "#262e3d", gui = "bold" },
            separator = { left = "", right = "" },
            draw_empty = false,
          }
        },
        lualine_x = {},
        lualine_y = {
          diagnostics,
          diff,
          -- {
          --   'filetype',
          --   color = { bg = "#2f3549", fg = "", gui = "bold" },
          --   separator = { left = "", right = "" },
          -- },
          -- space
        },
        -- lualine_y = {
        --   {
        --     'progress',
        --     separator = { left = "", right = "" },
        --   }
        -- },
        lualine_z = { {
          'filename',
          symbols = {
            modified = '',
          },
          separator = { left = "", right = "" },
        } },
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
        lualine_a = {
          {
            'filename',
            symbols = {
              modified = '',
            },
            separator = { left = "", right = "" },
          }
        },
        lualine_z = {
          {
            "tabs",
            mode = 2,
            symbols = {
              modified = '',
            },
            separator = { left = "", right = "" },
          }
        }
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
