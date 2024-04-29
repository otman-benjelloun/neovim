require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Treesitter
  require 'plugins.nvim-treesitter',

  -- LSP
  require 'plugins.nvim-lspconfig',

  -- Formatters
  require 'plugins.conform',

  -- Autocompletion
  require 'plugins.nvim-cmp',
  require 'plugins.lsp_signature',

  -- Linting
  require 'plugins.lint',

  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.tokyonight',
  require 'plugins.indent_line',
  require 'plugins.autopairs',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
