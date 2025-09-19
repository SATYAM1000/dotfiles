return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {
          mocha = {
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#cba6f7",
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            text = "#cdd6f4",
            subtext1 = "#bac2de",
            subtext0 = "#a6adc8",
            overlay2 = "#9399b2",
            overlay1 = "#7f849c",
            overlay0 = "#6c7086",
            surface2 = "#585b70",
            surface1 = "#45475a",
            surface0 = "#313244",
            base = "#1e1e2e",
            mantle = "#181825",
            crust = "#11111b",
          },
        },
        custom_highlights = function(colors)
          return {
            -- Make the main editor as dark as the sidebar
            Normal = { bg = colors.mantle },
            NormalFloat = { bg = colors.mantle },
            NormalNC = { bg = colors.mantle },
            LineNr = { bg = colors.mantle },
            SignColumn = { bg = colors.mantle },
            EndOfBuffer = { bg = colors.mantle },
            -- Keep sidebar consistent
            NvimTreeNormal = { bg = colors.mantle },
            NvimTreeNormalNC = { bg = colors.mantle },
            NvimTreeEndOfBuffer = { bg = colors.mantle },
            -- Make splits and borders blend
            VertSplit = { bg = colors.mantle, fg = colors.surface0 },
            WinSeparator = { bg = colors.mantle, fg = colors.surface0 },
            StatusLine = { bg = colors.base },
            StatusLineNC = { bg = colors.base },
            -- Lualine specific highlights
            lualine_c_normal = { bg = colors.base },
            lualine_b_normal = { bg = colors.base },
            lualine_a_normal = { bg = colors.blue, fg = colors.base },
          }
        end,
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { 
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = false,
          },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          navic = { 
            enabled = true,
            custom_bg = "NONE",
          },
          neotree = true,
          neotest = true,
          noice = true,
          notify = true,
          nvimtree = true,
          octo = true,
          overseer = true,
          pounce = true,
          rainbow_delimiters = true,
          semantic_tokens = true,
          telescope = {
            enabled = true,
            style = "nvchad", -- or "classic"
          },
          treesitter = true,
          treesitter_context = true,
          trouble = true,
          vim_sneak = true,
          vimwiki = true,
          which_key = true,
        },
      })
      
      -- load the colorscheme here
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
