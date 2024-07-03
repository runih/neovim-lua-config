return {
  'williamboman/mason.nvim',
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local mason_loaded, mason = pcall(require, 'mason')
    local mason_lspconfig_loaded, mason_lspconfig = pcall(require, 'mason-lspconfig')

    if mason_loaded and mason_lspconfig_loaded then
      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = {}
      })
    end
  end
}
