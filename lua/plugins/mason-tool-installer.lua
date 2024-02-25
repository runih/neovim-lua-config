return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- in charge of managing lsp servers, linters & formatters
  },
  config = function()
    local mason_tool_installer_loaded, mason_tool_installer =
      pcall(require, 'mason-tool-installer')
    if not mason_tool_installer_loaded then
      return
    end
    mason_tool_installer.setup({})
  end,
}
