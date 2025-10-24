return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  opts = {},
  keys = {
    {
      '<leader>M',
      mode = 'n',
      '<cmd>Mason<CR>',
      { desc = '[M]ason' },
    },
  },
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {},
    },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
}
