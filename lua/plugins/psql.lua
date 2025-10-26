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
    { '<leader>pp', "<cmd>lua require('psql.pgpass').open()<cr>", desc = 'Open ~/.pgpass file' },
  },
}
