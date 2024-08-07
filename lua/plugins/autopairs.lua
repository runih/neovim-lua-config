return {
  -- auto closing
  'windwp/nvim-autopairs',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/nvim-cmp',
  },

  config = function()
    local autopairs_loaded, autopairs = pcall(require, 'nvim-autopairs')
    local cmp_autopairs_loaded, cmp_autopairs =
      pcall(require, 'nvim-autopairs.completion.cmp')
    local cmp_loaded, cmp = pcall(require, 'cmp')

    if autopairs_loaded then
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
          javascript = { 'template_string' }, -- don't add pairs in javascript template_string
          java = false, -- don't check treesitter on java
        },
      })
    end

    if cmp_autopairs_loaded and cmp_loaded then
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  end,
}
