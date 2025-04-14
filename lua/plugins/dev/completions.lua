return {
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Set up VS Code-like formatting with icons at the leftmost position
      local formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            symbol_map = {
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "󰊕",
              Field = "󰜢",
              Variable = "",
              Class = "󰠱",
              Interface = "",
              Module = "󰕳",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "󰈇",
              Folder = "󰉋",
              EnumMember = "",
              Constant = "󰏿",
              Struct = "󰙅",
              Event = "",
              Operator = "󰆕",
              TypeParameter = "",
            },
          })(entry, vim_item)

          -- Set a name for each source
          local source_names = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            path = "[Path]",
            cmdline = "[Cmd]",
          }

          vim_item.menu = source_names[entry.source.name]
          return vim_item
        end,
      }

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
        formatting = formatting,
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
        formatting = formatting,
      })

      local options = {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = true,
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
          }),
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
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        formatting = formatting,
        -- Add highlight customization
        experimental = {
          ghost_text = true, -- Shows ghost text as you type
        },
      }

      cmp.setup(options)

      -- Function to link cmp highlights to existing theme highlights
      local function setup_cmp_highlights()
        -- Link to existing highlight groups that are likely present in most colorschemes
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { link = "Comment", default = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "Search", default = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "Search", default = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment", default = true })

        -- Link to various existing highlight groups for different kinds of items
        local kind_groups = {
          -- Methods/Functions
          ["CmpItemKindFunction"] = "Function",
          ["CmpItemKindMethod"] = "Function",
          ["CmpItemKindConstructor"] = "Function",

          -- Variables/Properties
          ["CmpItemKindVariable"] = "Identifier",
          ["CmpItemKindProperty"] = "Identifier",
          ["CmpItemKindField"] = "Identifier",

          -- Types/Classes
          ["CmpItemKindClass"] = "Type",
          ["CmpItemKindInterface"] = "Type",
          ["CmpItemKindStruct"] = "Type",
          ["CmpItemKindTypeParameter"] = "TypeDef",

          -- Keywords/Constants
          ["CmpItemKindKeyword"] = "Keyword",
          ["CmpItemKindConstant"] = "Constant",
          ["CmpItemKindEnum"] = "Constant",
          ["CmpItemKindEnumMember"] = "Constant",

          -- Text/Snippets
          ["CmpItemKindText"] = "String",
          ["CmpItemKindSnippet"] = "Special",

          -- Files/Folders
          ["CmpItemKindFile"] = "Directory",
          ["CmpItemKindFolder"] = "Directory",

          -- Other
          ["CmpItemKindUnit"] = "Number",
          ["CmpItemKindValue"] = "Number",
          ["CmpItemKindEvent"] = "Special",
          ["CmpItemKindReference"] = "Identifier",
          ["CmpItemKindModule"] = "Include",
          ["CmpItemKindOperator"] = "Operator",
          ["CmpItemKindColor"] = "Special",
        }

        -- Apply the links
        for cmp_group, link_group in pairs(kind_groups) do
          vim.api.nvim_set_hl(0, cmp_group, { link = link_group, default = true })
        end
      end

      -- Setup highlights when config loads
      setup_cmp_highlights()

      -- Reset completion menu highlights when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          setup_cmp_highlights()
        end,
      })
    end,
  },
}
