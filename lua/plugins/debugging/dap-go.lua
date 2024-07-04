return {
  'leoluz/nvim-dap-go',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dapgo_loaded, dapgo = pcall(require, 'dap-go')

    if dapgo_loaded then
      dapgo.setup()
    end
  end,
}
