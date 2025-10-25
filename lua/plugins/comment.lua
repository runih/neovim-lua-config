return {
  -- commenting with gc
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {} },
  },

  config = function()
    local comment_loaded, comment = pcall(require, 'Comment')
    local ts_context_commentstring_loaded, ts_context_commentstring =
        pcall(require, 'ts_context_commentstring.integrations.comment_nvim')

    if comment_loaded and ts_context_commentstring_loaded then
      ---@diagnostic disable-next-line: missing-fields
      comment.setup({
        pre_hook = ts_context_commentstring.create_pre_hook(),
      })
    end
  end,
}
