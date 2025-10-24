return {
  'stevearc/oil.nvim',
  lazy = true,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    {
      '-',
      mode = 'n',
      '<CMD>Oil<CR>',
      { desc = 'Open parent directory' }
    }
  }
}
