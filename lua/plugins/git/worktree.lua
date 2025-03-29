return {
  'ThePrimeagen/git-worktree.nvim',
  config = function()
    local loaded, worktree = pcall(require, 'git-worktree')
    if loaded then
      worktree.setup()
    end
  end,
}
