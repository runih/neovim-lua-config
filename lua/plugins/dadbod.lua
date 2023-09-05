return {
  -- Database plugins
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  config = function ()
    local ok, dadbob = pcall(require, 'config.dadbod')
    if not ok then
      return
    end

    dadbob.setup()
  end
}
