return {
  {
    "sschleemilch/slimline.nvim",
    opts = {
      bold = true,
      verbose_mode = false,
      components = { -- Choose components and their location
        left = {
          "mode",
          "path",
          "git",
          "recording",
        },
      },
      spaces = {
        components = "─",
        left = "",
        right = "",
      },
      hl = {
        modes = {
          normal = 'Type', -- highlight base of modes
          insert = 'Function',
          pending = 'Boolean',
          visual = 'Keyword',
          command = 'String',
        }
      },
      icons = {
        git = {
          branch = ''
        },
        lines = ''
      }
    },
  },
}
