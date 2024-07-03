return {
  -- tmux & split window navigation
  'alexghergh/nvim-tmux-navigation',
  lazy = false,
  config = function()
    local tmux_nav_loaded, tmux_nav = pcall(require, 'nvim-tmux-navigation')
    if tmux_nav_loaded then
      tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      local keymap = vim.keymap
      keymap.set('n', '<C-h>', tmux_nav.NvimTmuxNavigateLeft)
      keymap.set('n', '<C-j>', tmux_nav.NvimTmuxNavigateDown)
      keymap.set('n', '<C-k>', tmux_nav.NvimTmuxNavigateUp)
      keymap.set('n', '<C-l>', tmux_nav.NvimTmuxNavigateRight)
      keymap.set('n', '<C-\\>', tmux_nav.NvimTmuxNavigateLastActive)
      keymap.set('n', '<C-Space>', tmux_nav.NvimTmuxNavigateNext)
    end
  end,
}
