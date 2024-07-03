return {
  -- Database plugins
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  config = function()
    local dadbob_loaded, dadbob = pcall(require, 'config.dadbod')
    if dadbob_loaded then
      dadbob.setup()
    end
  end,
}
