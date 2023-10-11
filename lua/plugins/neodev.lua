return {
  'folke/neodev.nvim',
  config = function ()
    local ok, neodev = pcall(require, "neodev")
    if not ok then
      return
    end
    neodev.setup({})
  end
}
