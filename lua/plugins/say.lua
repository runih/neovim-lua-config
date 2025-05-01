return {
  'runih/say.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  dev = true,
  branch = 'main',
  lazy = true,
  keys = {
    {
      mode = { 'v' },
      '<c-t>',
      function()
        require('say').selected()
      end,
      desc = 'Say selected text',
    },
  },
  opts = {
    voice = 'Jamie',
    show_notification = true,
  },
}
