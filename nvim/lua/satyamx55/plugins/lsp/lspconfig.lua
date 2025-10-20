return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    -- Create an augroup for LSP formatting
    local format_group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Show signature help"
        keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        opts.desc = "Format code"
        keymap.set({ "n", "v" }, "<leader>lf", function()
          vim.lsp.buf.format({ async = false })
        end, opts)

        opts.desc = "Toggle inlay hints"
        if vim.lsp.inlay_hint then
          keymap.set("n", "<leader>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, opts)
        end

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

        -- Format on save for specific file types
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = format_group,
            buffer = ev.buf,
            callback = function()
              -- Only format specific file types automatically
              local ft = vim.bo[ev.buf].filetype
              local format_filetypes = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "css", "scss" }
              if vim.tbl_contains(format_filetypes, ft) then
                vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
              end
            end,
          })
        end
      end,
    })

    -- Enhanced capabilities for better import suggestions
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }

    -- Setup servers using modern vim.lsp.config approach
    local mason_lspconfig = require("mason-lspconfig")
    local servers = mason_lspconfig.get_installed_servers()

    -- Server-specific configurations
    local server_configs = {
      svelte = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              if ctx.match then
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end
            end,
          })
        end,
      },
      graphql = {
        capabilities = capabilities,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
      emmet_ls = {
        capabilities = capabilities,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      },
      ts_ls = {
        capabilities = capabilities,
        settings = {
          typescript = {
            suggest = {
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithClassMemberSnippets = true,
              includeCompletionsWithObjectLiteralMethodSnippets = true,
            },
            preferences = {
              includePackageJsonAutoImports = "auto",
              importModuleSpecifierPreference = "relative",
            },
          },
          javascript = {
            suggest = {
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithClassMemberSnippets = true,
              includeCompletionsWithObjectLiteralMethodSnippets = true,
            },
            preferences = {
              includePackageJsonAutoImports = "auto",
              importModuleSpecifierPreference = "relative",
            },
          },
        },
      },
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    -- Setup each installed server
    for _, server_name in ipairs(servers) do
      local config = server_configs[server_name] or { capabilities = capabilities }

      -- Always use lspconfig for compatibility
      lspconfig[server_name].setup(config)
    end
  end,
}