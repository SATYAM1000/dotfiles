return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with catppuccin theme
    lualine.setup({
      options = {
        theme = "catppuccin", -- Use catppuccin theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
        globalstatus = true, -- Use single statusline for all windows
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { 
          "branch", 
          "diff", 
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = "DiagnosticError",
              warn = "DiagnosticWarn",
              info = "DiagnosticInfo",
              hint = "DiagnosticHint",
            },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path, 3: Absolute with tilde
            shorting_target = 40,
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "trouble", "quickfix", "toggleterm" },
    })
  end,
}
