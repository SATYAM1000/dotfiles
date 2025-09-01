return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
    })
    
    -- Register key groups
    wk.register({
      ["<leader>"] = {
        f = { name = "+find/files" },
        s = { name = "+split" },
        t = { name = "+tabs/terminal" },
        e = { name = "+explorer" },
        c = { name = "+code" },
        r = { name = "+rename/reload" },
        d = { name = "+diagnostics" },
        g = { name = "+git" },
        w = { name = "+windows" },
        m = { name = "+format" },
        n = { name = "+numbers" },
        D = { name = "+debug/diagnostics" },
        l = { name = "+linting" },
      },
      g = {
        name = "+goto",
      },
      ["["] = { name = "+prev" },
      ["]"] = { name = "+next" },
      s = { name = "+surround/split" },
    })
  end,
}
