return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
      vim.cmd 'filetype plugin indent on'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.maplocalleader = ','
      vim.g.vimtex_syntax_enabled = 0
      -- vim.g.vimtex_quickfix_enabled = 0
      -- vim.o.foldmethod = 'expr'
      -- vim.o.foldexpr = 'vimtex#fold#level(v:lnum)'
      -- vim.o.foldtext = 'vimtex#fold#text()'
      -- vim.o.foldlevel = 2
      vim.g.vimtex_mappings_disable = { ['n'] = { 'K' } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable 'pplatex' == 1 and 'pplatex' or 'latexlog'
    end,
  },
}
