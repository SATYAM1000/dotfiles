return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]], -- Default mapping
      hide_numbers = true,
      shade_filetypes = {},
      autochdir = false,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        width = 120,
        height = 30,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Custom keymaps
    local keymap = vim.keymap

    -- Terminal toggle keymaps
    keymap.set("n", "tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
    keymap.set("t", "tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

    -- Exit terminal mode easily
    keymap.set("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

    -- Terminal navigation
    keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to left window" })
    keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to down window" })
    keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to up window" })
    keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to right window" })
  end,
}