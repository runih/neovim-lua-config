return {
  -- commenting with gc
  'numToStr/Comment.nvim',

  config = function()
    local loaded, comment = pcall(require, "Comment")
    if not loaded then
      return
    end

    comment.setup()
  end
}
