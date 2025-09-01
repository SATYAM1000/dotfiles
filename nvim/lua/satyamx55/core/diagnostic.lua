-- satyamx55/core/diagnostic.lua

-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '■', '▎', 'x', '●', etc
    source = "if_many",
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
  float = {
    source = true,
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = true, -- Show diagnostics even in insert mode
  severity_sort = true,
})

-- Define keymap for floating diagnostic
local keymap = vim.keymap
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostic float" })

-- Make the diagnostic float window appear automatically when hovering over errors
vim.cmd([[
  augroup DiagnosticHover
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  augroup END
]])

-- Note: updatetime is set in core/options.lua to 300ms
