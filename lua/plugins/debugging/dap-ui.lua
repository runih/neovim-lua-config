return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dapui_loaded, dapui = pcall(require, 'dapui')
    if dapui_loaded then
      dapui.setup()
    end
  end,
}
