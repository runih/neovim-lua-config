return {
  'lewis6991/gitsigns.nvim',

  config = function()
    local setup, gitsigns = pcall(require , "gitsigns")
    if not setup then
      return
    end

    gitsigns.setup()
  end
}
