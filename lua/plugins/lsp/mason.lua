return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {},
      keys = {
        {
          '<leader>M',
          mode = 'n',
          '<cmd>Mason<CR>',
          { desc = '[M]ason' }
        }
      }
    },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  opts = {},
}
