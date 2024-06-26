-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'
    local cond = require 'nvim-autopairs.conds'
    npairs.add_rules {
      Rule('$', '$', { 'tex', 'latex' })
        -- don't add a pair if the next character is %
        :with_pair(cond.not_after_regex '%%')
        -- don't move right when repeat character
        :with_move(cond.none()),
    }
  end,
}
