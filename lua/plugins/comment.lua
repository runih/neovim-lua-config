return {
  -- commenting with gc
  'numToStr/Comment.nvim',

  config = function()
    local ok, comment = pcall(require, 'Comment')
    if not ok then
      return
    end

    comment.setup()
  end,
}
