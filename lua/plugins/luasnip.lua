return {
  -- LuaSnip snippet engine
  'L3MON4D3/LuaSnip',
  build = (function()
    -- Build Step is needed for regex support in snippets.
    -- This step is not supported in many windows environments.
    -- Remove the below condition to re-enable on windows.
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  dependencies = {
    -- `friendly-snippets` contains a variety of premade snippets.
    --    See the README about individual language/framework/plugin snippets:
    --    https://github.com/rafamadriz/friendly-snippets
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  opts = {
    -- remember last snippet to be able to jump back to it
    history = true,

    -- update text as you are typing
    updateevents = 'TextChanged,TextChangedI',

    -- Enable Autosnippets
    enable_autosnippets = true,
  },

  config = function(_, opts)
    local ls = require 'luasnip'
    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if ls.locally_jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    require('luasnip').setup(opts)
  end,
}
