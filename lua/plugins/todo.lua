return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local todo_comments_loaded, todo_comments = pcall(require, 'todo-comments')
    local keymap = vim.keymap

    if todo_comments_loaded then
      keymap.set('n', ']t', function()
        todo_comments.jump_next()
      end, { desc = 'Next todo comment' })

      keymap.set('n', '[t', function() end, { desc = 'Previous todo comment' })

      todo_comments.setup()
    end
  end,
}
