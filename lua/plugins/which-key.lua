return {
  -- Show leader mappings
  'folke/which-key.nvim',
  config = function()
    local ok, whichkey = pcall(require, "which-key")
    if not ok then
      return
    end

    whichkey.setup()
  end
}
