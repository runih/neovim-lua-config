return {
  'runih/psql.nvim',
  dev = true,
  branch = 'development',
  config = function()
    local psql_loaded, psql = pcall(require, 'psql')
    if psql_loaded then
      psql.setup({})
    end
  end,
  dependencies = {
    'runih/cmd.nvim',
    dev = true,
    config = function()
      local cmd_loaded, cmd = pcall(require, 'cmd')
      if cmd_loaded then
        cmd.setup({})
      end
    end,
  },
}
