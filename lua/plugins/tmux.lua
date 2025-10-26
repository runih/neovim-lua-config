return {
  -- tmux & split window navigation
  'alexghergh/nvim-tmux-navigation',
  lazy = false,
  opts = {
    disable_when_zoomed = true, -- defaults to false
  },
  keys = {
    { '<C-h>',     "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLeft()<cr>",       desc = 'Navigate to left window or tmux pane' },
    { '<C-j>',     "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateDown()<cr>",       desc = 'Navigate to lower window or tmux pane' },
    { '<C-k>',     "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateUp()<cr>",         desc = 'Navigate to upper window or tmux pane' },
    { '<C-l>',     "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateRight()<cr>",      desc = 'Navigate to right window or tmux pane' },
    { '<C-\\>',    "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateLastActive()<cr>", desc = 'Navigate to last active window or tmux pane' },
    { '<C-Space>', "<cmd>lua require('nvim-tmux-navigation').NvimTmuxNavigateNext()<cr>",       desc = 'Navigate to next window or tmux pane' },
  },
}
