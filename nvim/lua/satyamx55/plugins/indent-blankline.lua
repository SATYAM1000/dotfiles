return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  dependencies = { "catppuccin/nvim" },
  config = function()
    local hooks = require("ibl.hooks")

    -- Reset highlights on colorscheme change
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Catppuccin Mocha colors
      -- normal indent (subtle surface color)
      vim.api.nvim_set_hl(0, "IndentGrey", { fg = "#45475a" })

      -- scope highlight (Catppuccin rainbow)
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94e2d5" })
    end)

    require("ibl").setup({
      indent = { 
        highlight = { "IndentGrey" },
        char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
        char = "│",
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "nvim-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })

    -- Use Treesitter extmarks for scope detection
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
