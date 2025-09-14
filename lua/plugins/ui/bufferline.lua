return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufAdd" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.bufremove",
  },
  opts = {
    options = {
      mode = "buffers",
      numbers = "none",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      buffer_close_icon = "",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = "bdelete! %d",
      modified_icon = " ",
      left_trunc_marker = "|",
      right_trunc_marker = "|",
      max_name_length = 14,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 15,
      always_show_bufferline = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      show_close_icon = true,
      color_icons = true,
      enforce_regular_tabs = true,
      separator_style = { "any", "any" }, -- slant, slope, thick, thin, {'any', 'any'}
      indicator = { style = "none" },
      exclude_ft = { "help", "alpha", "toggleterm", "lir", "dashboard" },
      custom_filter = function(bufnr)
        return vim.bo[bufnr].buflisted
      end,
      themable = true,
      custom_areas = {
        right = function()
          return {
            {
              text = "%@v:lua.RunBuffer@%#BufferlineRun#  %X",
              highlight = "BufferlineRun",
            },
            {
              text = "%@v:lua.SplitBuffer@%#BufferlineSplit#  %X",
              highlight = "BufferlineSplit",
            },
            {
              text = "%@v:lua.ToggleTransparency@%#BufferlineTransparency# 󱡔 %X",
              highlight = "BufferlineTransparency",
            },
            {
              text = "%@v:lua.ToggleTheme@%#BufferlineTheme# 󱥚 %X",
              highlight = "BufferlineTheme",
            },
            {
              text = "%@v:lua.CloseAll@%#BufferlineCloseAll# 󰅗 %X",
              highlight = "BufferlineCloseAll",
            },
          }
        end,
      },
    },
    highlights = require "themes.integrations.bufferline",
  },
  config = function(_, opts)
    function _G.SplitBuffer()
      vim.cmd "vsplit"
    end

    function _G.RunBuffer()
      require("core.functions").build_run()
    end

    function _G.ToggleTheme()
      require("themes.pick").random()
    end

    function _G.ToggleTransparency()
      require("themes").toggle_transparency()
    end

    function _G.CloseAll()
      local bd = require("mini.bufremove").delete
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[bufnr].buflisted then
          bd(bufnr, true)
        end
      end
    end

    -- Inicializar bufferline
    ---@diagnostic disable-next-line: different-requires
    require("bufferline").setup(opts)

    -- 👇 Definir highlights custom (que no son de Bufferline oficial)
    local colors = require("themes").get_theme_tb "base_30"
    local blend = require("themes.colors").blend

    vim.api.nvim_set_hl(0, "BufferlineRun", { fg = colors.teal, bg = blend(colors.teal, colors.black, 0.15) })
    vim.api.nvim_set_hl(0, "BufferlineSplit", { fg = colors.green, bg = blend(colors.green, colors.black, 0.15) })
    vim.api.nvim_set_hl(0, "BufferlineTheme", { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.15) })
    vim.api.nvim_set_hl(0, "BufferlineTransparency", { fg = colors.blue, bg = blend(colors.blue, colors.black, 0.15) })
    vim.api.nvim_set_hl(0, "BufferlineCloseAll", { fg = colors.red, bg = blend(colors.red, colors.black, 0.15) })

    -- Keymaps
    local map = vim.keymap.set
    local bd = require("mini.bufremove").delete

    map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    map("n", "<C-q>", function()
      bd(0, true)
    end, { desc = "Close buffer" })
    map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
    map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin buffer" })
  end,
}
