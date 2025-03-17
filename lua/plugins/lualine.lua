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
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
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
        theme = 'carbonfox',
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
        lualine_b = { { 'branch', icons_enabled = true, icon = '' } },
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
