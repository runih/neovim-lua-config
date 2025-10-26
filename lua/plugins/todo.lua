return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  keys = {
    { ']t', "<cmd>lua require('todo-comments').jump_next()<cr>", desc = 'Next todo comment' },
    { '[t', "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = 'Previous todo comment' },
  },
}
