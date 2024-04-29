return {
  {
    'ray-x/lsp_signature.nvim',
    opts = {
      hint_enable = false,
      bind = true,
      doc_lines = 10,
      handler_opts = { border = 'rounded' },
      max_width = 80,
      max_height = 12,
      wrap = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      fix_pos = false,
      close_timeout = 1000,
      hi_parameter = 'LspSignatureActiveParameter',
      always_trigger = false,
      zindex = 200,
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}
