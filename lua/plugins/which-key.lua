return {
  -- Show leader mappings
  'folke/which-key.nvim',
  config = function()
    local setup, whichkey = pcall(require, "which-key")
    if not setup then
      return
    end

    whichkey.setup()
  end
}
