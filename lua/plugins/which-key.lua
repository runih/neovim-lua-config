return {
  'folke/which-key.nvim',
  lazy = false,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration goes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
