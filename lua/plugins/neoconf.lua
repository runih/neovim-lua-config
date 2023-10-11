return {
  'folke/neoconf.nvim',
  config = function ()
    local ok, neoconf = pcall(require, "neoconf")
    if not ok then
      return
    end
    neoconf.setup({})
  end
}
