return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  keys = {
    {
      '<leader>do',
      mode = { 'n' },
      function()
        require('dapui').open()
      end,
      desc = '[d]ebug UI [o]pen',
    },
    {
      '<leader>dc',
      mode = { 'n' },
      function()
        require('dapui').close()
      end,
      desc = '[d]ebug UI [c]close',
    },
  },
  config = function()
    local dapui_loaded, dapui = pcall(require, 'dapui')
    if dapui_loaded then
      dapui.setup()
    end
  end,
}
