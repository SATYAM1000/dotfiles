return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp", -- LSP source for autocompletion
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
        -- Don't trigger completion automatically for single digits
        keyword_length = 1, -- Minimum 1 character before showing completions
      },
      preselect = cmp.PreselectMode.None, -- Don't preselect items
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 100,
      },
      -- Show more detailed information in completion menu
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      -- Disable completion for certain patterns
      enabled = function()
        -- Disable completion in comments
        local context = require("cmp.config.context")
        if context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
          return false
        end
        
        -- Get current line and cursor position
        local col = vim.fn.col(".") - 1
        local line = vim.fn.getline(".")
        local before_cursor = line:sub(1, col)
        
        -- Disable if we're just typing numbers
        if before_cursor:match("%d+$") and not before_cursor:match("[%a_]%d+$") then
          return false
        end
        
        return true
      end,
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept selected item or fallback to normal CR
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 }, -- snippets
        { 
          name = "buffer", 
          priority = 500,
          option = {
            -- Don't show buffer completions for words shorter than 3 characters
            keyword_length = 3,
            -- Don't index numbers as completion candidates
            keyword_pattern = [[\k\+]], -- Only match keyword characters, not plain numbers
          }
        }, -- text within current buffer
        { name = "path", priority = 900 }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          -- Show import source information
          before = function(entry, vim_item)
            -- Show import source for LSP completions
            if entry.source.name == "nvim_lsp" then
              -- Try to get the import source from the completion item
              local completion_item = entry:get_completion_item()
              if completion_item and completion_item.detail then
                vim_item.menu = completion_item.detail
              elseif completion_item and completion_item.source then
                vim_item.menu = completion_item.source
              else
                -- Fallback to LSP client name
                local source_name = entry.source.source.client.name
                if source_name then
                  vim_item.menu = "[" .. source_name .. "]"
                end
              end
            end
            return vim_item
          end,
        }),
      },
    })
  end,
}
