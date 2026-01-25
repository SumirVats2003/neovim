vim.pack.add({
  -- tooling
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/Goose97/timber.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/pmizio/typescript-tools.nvim" },
  { src = "https://github.com/NMAC427/guess-indent.nvim" },
  { src = "https://github.com/tjdevries/present.nvim" },

  -- treesitter
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "master"
  },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },

  -- ui
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/rose-pine/neovim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/nvimdev/indentmini.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/folke/noice.nvim" },
  { src = "https://github.com/rcarriga/nvim-notify" },

  -- lsp and autocompletions
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/ray-x/lsp_signature.nvim" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },

  -- java
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-java/nvim-java',
})

require("oil").setup({
  view_options = {
    show_hidden = true
  },
})
require("fzf-lua").setup({
  winopts = {
    width = 0.85,
    cursor_line = false
  },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  }
})
require("timber").setup({
  log_templates = {
    default = {
      javascript = [[console.log("%log_target:", %log_target)]],
      typescript = [[console.log("%log_target:", %log_target)]],
    }
  }
})
require("diffview").setup()
require("gitsigns").setup({
  current_line_blame = true,
  signcolumn         = true,
  numhl              = false
})
require("mini.surround").setup()
require("typescript-tools").setup({})
require("guess-indent").setup({})
require("present").setup {}

require("tokyonight").setup({
  transparent = true
})
require("rose-pine").setup({
  dim_inactive_windows = false,
  groups = {
    border = "overlay",
  }
})
require("lualine").setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true
  },
  sections = {
    lualine_b = {
      -- { "branch", icon = { '' } }
    },
    lualine_c = {
      {
        'filetype',
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 }
      },
      {
        'filename',
        symbols = {
          modified = '',
          readonly = '󰌾',
          unnamed = ' 󰡯',
          newfile = ' 󰝒'
        },
        padding = { left = 0, right = 1 }
      },
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
        -- separator = { left = "", right = "" },
        draw_empty = false,
      }
    },
    lualine_x = {
      {
        'diff',
        colored = true,
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      }
    },
    lualine_y = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰛨 ' },
        colored = true,
        update_in_insert = true,
        always_visible = false,
      }
    },
    lualine_z = { 'lsp_status' }
  }
})
require("nvim-autopairs").setup()
require("todo-comments").setup()
require("indentmini").setup()
require("noice").setup({
  lsp = {
    progress = { enabled = false },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    command_palette = true,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = false
  },
  popupmenu = {
    enabled = false
  }
})
require("notify").setup({
  max_width = 40
})

require('java').setup()
require "lsp_signature".setup()
require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "typescript", "javascript", "lua", "html", "css", "angular", "java", "python" },
  highlight = { enable = true }
})
require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
        ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
        ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
        ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
        ["<leader>n:"] = "@property.outer",  -- swap object property with next
        ["<leader>nm"] = "@function.outer",  -- swap function with next
      },
      swap_previous = {
        ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
        ["<leader>p:"] = "@property.outer",  -- swap object property with prev
        ["<leader>pm"] = "@function.outer",  -- swap function with previous
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = { query = "@call.outer", desc = "Next function call start" },
        ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
        ["]c"] = { query = "@class.outer", desc = "Next class start" },
        ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
        ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]F"] = { query = "@call.outer", desc = "Next function call end" },
        ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
        ["]C"] = { query = "@class.outer", desc = "Next class end" },
        ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
      },
      goto_previous_start = {
        ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
        ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
        ["[c"] = { query = "@class.outer", desc = "Prev class start" },
        ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
        ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
      },
      goto_previous_end = {
        ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
        ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
        ["[C"] = { query = "@class.outer", desc = "Prev class end" },
        ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
        ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
      },
    },
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

local options = {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    }
  ),
}
cmp.setup(options)
