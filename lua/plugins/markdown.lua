return {
  {
    'preservim/vim-markdown',
    dependencies = {
      'godlygeek/tabular',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    config = function ()
      vim.g.mkdp_browser = '/Applications/Vivaldi.app/Contents/MacOS/Vivaldi'
      vim.g.mkdp_auto_close = 0
    end
  }
}
