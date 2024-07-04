return {
  'theHamsta/nvim-dap-virtual-text',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local dap_virtual_text_loaded, dap_virtual_text =
      pcall(require, 'nvim-dap-virtual-text')

    if dap_virtual_text_loaded then
      dap_virtual_text.setup({})
    end
  end,
}
