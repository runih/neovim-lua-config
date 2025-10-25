return {
  -- tmux & split window navigation
  'alexghergh/nvim-tmux-navigation',
  lazy = false,
  opts = {
    disable_when_zoomed = true, -- defaults to false
  },
  keys = {
    {
      '<C-h>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateLeft()
      end,
      { desc = 'Navigate to left window or tmux pane' }
    },
    {
      '<C-j>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateDown()
      end,
      { desc = 'Navigate to lower window or tmux pane' }
    },
    {
      '<C-k>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateUp()
      end,
      { desc = 'Navigate to upper window or tmux pane' }
    },
    {
      '<C-l>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateRight()
      end,
      { desc = 'Navigate to right window or tmux pane' }
    },
    {
      '<C-\\>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()
      end,
      { desc = 'Navigate to last active window or tmux pane' }
    },
    {
      '<C-Space>',
      function()
        require 'nvim-tmux-navigation'.NvimTmuxNavigateNext()
      end,
      { desc = 'Navigate to next window or tmux pane' }
    },
  },
}
