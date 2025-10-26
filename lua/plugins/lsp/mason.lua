return {
  'williamboman/mason-lspconfig.nvim',
  lazy = false,
  opts = {},
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          -- border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  keys = {
    { '<leader>M', mode = 'n', '<cmd>Mason<CR>', desc = '[M]ason' },
  },
}
