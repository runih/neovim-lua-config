return {
  'runih/say.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  dev = true,
  branch = 'main',
  lazy = true,
  opts = {
    voice = 'Jamie',
    show_notification = true,
  },
  keys = {
    { mode = { 'v' }, '<c-t>', "<cmd>lua require('say').selected()<cr>", desc = 'Say selected text' },
  },
}
