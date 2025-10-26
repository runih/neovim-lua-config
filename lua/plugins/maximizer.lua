return {
  'szw/vim-maximizer', -- maximizes and restores current wimdow
  lazy = true,
  keys = {
    { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
  },
}
