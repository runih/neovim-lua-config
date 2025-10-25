return {
  'runih/psql.nvim',
  lazy = true,
  dev = true,
  branch = 'development',
  opts = {},
  dependencies = {
    'runih/cmd.nvim',
    lazy = true,
    dev = true,
    opts = {},
  },
  keys = {
    {
      '<leader>pp',
      function()
        require('psql.pgpass').open()
      end,
      desc = 'Open ~/.pgpass file',
    },
  },
}
