return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Function to check if eslint config exists
    local function eslint_config_exists()
      local config_files = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        "package.json", -- might contain eslintConfig
      }
      
      for _, config in ipairs(config_files) do
        if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. config) == 1 then
          -- For package.json, check if it contains eslintConfig
          if config == "package.json" then
            local file = io.open(vim.fn.getcwd() .. "/" .. config, "r")
            if file then
              local content = file:read("*all")
              file:close()
              if content:match('"eslintConfig"') then
                return true
              end
            end
          else
            return true
          end
        end
      end
      return false
    end

    -- Function to update linters based on config availability
    local function update_linters()
      if eslint_config_exists() then
        lint.linters_by_ft = {
          javascript = { "eslint_d" },
          typescript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescriptreact = { "eslint_d" },
          svelte = { "eslint_d" },
          python = { "pylint" },
        }
      else
        -- No eslint config, only set up Python linting
        lint.linters_by_ft = {
          python = { "pylint" },
        }
      end
    end

    -- Initial setup
    update_linters()

    -- Update linters when changing directories
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        update_linters()
      end,
    })

    -- Configure eslint_d for better error messages
    lint.linters.eslint_d = lint.linters.eslint_d or {}
    lint.linters.eslint_d.args = {
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    -- Create an autocommand group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Store timer reference to prevent memory leaks
    local lint_timer = nil

    -- Real-time linting (as you type)
    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "TextChangedI", -- Trigger during insert mode text changes
      "TextChanged", -- Trigger during normal mode text changes
    }, {
      group = lint_augroup,
      callback = function()
        -- Cancel existing timer if it exists
        if lint_timer then
          lint_timer:stop()
          lint_timer:close()
        end
        
        -- Create new timer for debouncing
        lint_timer = (vim.uv or vim.loop).new_timer()
        if lint_timer then
          lint_timer:start(
            300,
            0,
            vim.schedule_wrap(function()
              lint.try_lint()
              -- Clean up timer after execution
              if lint_timer then
                lint_timer:close()
                lint_timer = nil
              end
            end)
          )
        else
          -- Fallback if timer creation fails
          lint.try_lint()
        end
      end,
    })

    -- Also enable diagnostic updates in insert mode
    vim.diagnostic.config({
      update_in_insert = true, -- Show diagnostics even in insert mode
    })

    -- Keymapping to manually trigger linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
