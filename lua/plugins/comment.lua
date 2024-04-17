return {
  -- commenting with gc
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },

  config = function()
    local comment_loaded, comment = pcall(require, 'Comment')
    if not comment_loaded then
      return
    end

    local ts_context_commentstring_loaded, ts_context_commentstring =
      pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
    if not ts_context_commentstring_loaded then
      return
    end

    ---@diagnostic disable-next-line: missing-fields
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
