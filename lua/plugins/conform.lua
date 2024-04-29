return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,

    dependencies = {
      -- Automatically install formatters
      { 'zapling/mason-conform.nvim', config = true },
    },

    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },

    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.

        -- clang-format is not needed, clangd has built-in formatting
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 5000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      -- add options to some formatters
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
        tex = { 'latexindent' },
      },

      -- add formatter options / custom formatters
      formatters = {
        latexindent = {
          prepend_args = { '-m', '-g', 'auto.log' },
        },
      },
    },
  },
}
