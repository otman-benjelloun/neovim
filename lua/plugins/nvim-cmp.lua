return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      require 'plugins.luasnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',

      'kdheepak/cmp-latex-symbols',

      -- vimtex
      require 'plugins.vimtex',
      -- vimtex completion
      'micangl/cmp-vimtex',

      -- comparator
      'lukas-reineke/cmp-under-comparator',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        completion = { completeopt = 'menu,menuone,noinsert' },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = function(entry, vim_item)
            local kind_icons = require('icons').kind
            vim_item.kind = kind_icons[vim_item.kind] .. ' ' .. vim_item.kind

            local source_strings = {
              luasnip = '[SNP]',
              nvim_lua = '[LSP]',
              nvim_lsp = '[LSP]',
              buffer = '[BUF]',
              path = '[PATH]',
              cmdline = '[CMD]',
              vimtex = '[TeX]',
              latex_symbols = '[SYM]',
            }

            local source = entry.source.name
            vim_item.menu = source_strings[source]

            vim_item.abbr = vim_item.abbr:match '[^(]+'

            return vim_item
          end,
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.score,
              cmp.config.compare.recently_used,
              require('cmp-under-comparator').under,
              cmp.config.compare.kind,
            },
          },
        },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},
        },

        sources = {
          -- Snippet completion
          { name = 'luasnip', keyword_length = 1 },

          -- LSP completion
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },

          -- Misc completion
          { name = 'buffer', keyword_length = 4 },
          { name = 'path' },
        },

        -- Sources only for certain file types
        cmp.setup.filetype({ 'tex', 'plaintex', 'bib' }, {
          sources = cmp.config.sources {
            { name = 'vimtex' },
            {
              name = 'latex_symbols',
              option = { strategy = 2 },
            },
          },
        }),

        -- Sources for commandline
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
          }, {
            { name = 'cmdline' },
          }),
          matching = { disallow_symbol_nonprefix_matching = false },
          formatting = {
            fields = { 'abbr' },
          },
        }),

        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
