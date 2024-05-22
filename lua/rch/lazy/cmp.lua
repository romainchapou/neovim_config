return {
  {
    'hrsh7th/nvim-cmp',

    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      -- vsnip
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },

    event = "VeryLazy",

    config = function()
      local cmp = require("cmp")

      cmp.setup{
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },

        -- be very restrictive on the matching
        matching = {
          disallow_fullfuzzy_matching = true,
          disallow_fuzzy_matching = true,
          disallow_partial_matching = true,
          disallow_partial_fuzzy_matching = true,
          disallow_prefix_unmatching = true,
        },

        -- don't always show the completion pop up in insert mode
        completion = { autocomplete = false, },

        mapping = {
          -- Use Tab to trigger completion
          -- Should still input a tab when char before cursor is blank
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
              return
            end

            if not cmp.visible() then
              cmp.complete()
            end

            cmp.select_next_item()
          end, { 'i', 's' }),

          -- Use Shift-Tab to navigate backwards in the completion menu
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),

          ['<C-j>'] = cmp.mapping.scroll_docs(4),
          ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        },

        sources = {
          { name = 'nvim_lsp', group_index = 1 },
          { name = 'buffer', group_index = 2 },
          { name = 'path' },
        },

      }

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      local cmd_line_mappings = cmp.mapping.preset.cmdline()
      cmd_line_mappings["<tab>"] = {
        c = function()
          if not cmp.visible() then cmp.complete() end
          cmp.select_next_item()
        end
      }

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmd_line_mappings,
        sources = {
          { name = 'buffer' }
        }
      })
    end
  }
}
