return {
  'runih/psql.nvim',
  config = function ()
    local ok, psql = pcall(require, "psql")
    if not ok then
      return
    end
    psql.setup({})
  end,
    dependencies = {
      'runih/cmd.nvim',
      config = function ()
        local ok, cmd = pcall(require, "cmd")
        if not ok then
          return
        end
        cmd.setup({})
      end
    }
}
