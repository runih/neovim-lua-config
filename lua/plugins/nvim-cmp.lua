return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = 'make install_jsregexp',
    },
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp_loaded, cmp = pcall(require, 'cmp')
    local luasnip_loaded, luasnip = pcall(require, 'luasnip')
    local lspkind_loaded, lspkind = pcall(require, 'lspkind')

    if cmp_loaded and luasnip_loaded and lspkind_loaded then
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        completion = {
          completopt = 'menu,menuone,preview,noselect',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
          ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
          ['<C-b'] = cmp.mapping.scroll_docs(-4),
          ['<C-f'] = cmp.mapping.scroll_docs(4),
          ['<C-Space'] = cmp.mapping.complete(), -- show completion suggestions
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- snippets
          { name = 'buffer' }, -- text within current buffer
          { name = 'path' }, -- file system paths
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
      })
    end
  end,
}
