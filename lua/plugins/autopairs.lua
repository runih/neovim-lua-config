return {
  -- auto closing
  'windwp/nvim-autopairs',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/nvim-cmp',
  },

  config = function()
    local autopairs_loaded, autopairs = pcall(require, 'nvim-autopairs')
    if not autopairs_loaded then
      return
    end

    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
        javascript = { 'template_string' }, -- don't add pairs in javascript template_string
        java = false, -- don't check treesitter on java
      },
    })

    -- import nvim-autopairs completion functionality safely
    local cmp_autopairs_loaded, cmp_autopairs =
      pcall(require, 'nvim-autopairs.completion.cmp')
    if not cmp_autopairs_loaded then
      return
    end

    -- import nvim-cmp plugin safely (completions plugin)
    local cmp_loaded, cmp = pcall(require, 'cmp')
    if not cmp_loaded then
      return
    end

    -- make autopairs and completion work together
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
