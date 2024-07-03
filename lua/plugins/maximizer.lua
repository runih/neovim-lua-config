return {
  'szw/vim-maximizer', -- maximizes and restores current wimdow
  keys = {
    {
      '<leader>sm',
      '<cmd>MaximizerToggle<CR>',
      desc = 'Maximize/minimize a split',
    },
  },
}
