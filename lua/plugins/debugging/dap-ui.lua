return {
  'rcarriga/nvim-dap-ui',
  lazy = true,
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  keys = {
    { '<leader>do', mode = 'n', "<cmd>lua require('dapui').open()<cr>",  desc = '[d]ebug UI [o]pen' },
    { '<leader>dc', mode = 'n', "<cmd>lua require('dapui').close()<cr>", desc = '[d]ebug UI [c]close' },
  },
  opts = {},
}
