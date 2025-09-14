return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = vim.g.transparency and "rounded" or "solid",
        scrollbar = false,
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = vim.g.transparency and "rounded" or "solid",
        scrollbar = false,
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      },
    },
    mapping = {
      ["<C-Space>"] = require("cmp").mapping.complete(),
      ["<Esc>"] = require("cmp").mapping.abort(),
      ["<CR>"] = require("cmp").mapping.confirm { select = true },
      ["<Tab>"] = require("cmp").mapping(function(fallback)
        if require("cmp").visible() then
          require("cmp").select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = require("cmp").mapping(function(fallback)
        if require("cmp").visible() then
          require("cmp").select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        local kind_icons = {
          Array = "  ",
          Boolean = "  ",
          Class = "  ",
          Constant = "  ",
          Enum = "  ",
          EnumMember = "  ",
          Event = "  ",
          FunctionType = " 󰄦 ",
          Generic = "  ",
          Instance = "  ",
          Label = "  ",
          NumberLiteral = "  ",
          ObjectLiteral = "  ",
          OperatorType = "  ",
          PropertyType = "  ",
          TypeAlias = "  ",
          VariableType = "  ",
          Field = "  ",
          File = "  ",
          Folder = "  ",
          Function = " 󰊕 ",
          Interface = "  ",
          Key = "  ",
          Keyword = "  ",
          Method = " 󰆧 ",
          Module = "  ",
          Namespace = "  ",
          Null = " 󰟢 ",
          Number = "  ",
          Object = "  ",
          Operator = "  ",
          Package = "  ",
          Property = "  ",
          Reference = "  ",
          Snippet = "  ",
          String = "  ",
          Struct = "  ",
          Text = "  ",
          TypeParameter = "  ",
          Unit = "  ",
          Value = "  ",
          Variable = "  ",
          Supermaven = " 󰗚 ",
        }

        local format_color = require "plugins.lsp.extra.format"
        local icon = kind_icons[item.kind] or ""
        local kind = item.kind or ""
        item.menu = string.format("%-8s", kind)
        item.menu_hl_group = "CmpItemKind" .. kind
        item.kind = icon

        if kind == "Color" then
          format_color.lsp(entry, item, " ")
        end
        return item
      end,
    },
    sources = {
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "luasnip_choice" },
      { name = "snippy" },
      { name = "nvim_lua" },
      { name = "vsnip" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "supermaven" },
      { name = "copilot" },
      { name = "codeium" },
    },
  },
}
