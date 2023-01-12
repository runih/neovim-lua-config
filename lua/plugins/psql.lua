return {
  'runih/psql.nvim',
  config = function ()
    local ok, psql = pcall(require, "psql")
    if not ok then
      return
    end
    psql.setup({})
  end
}
