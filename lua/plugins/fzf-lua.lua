return {
  'ibhagwan/fzf-lua',
  enabled = true,
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    winopts = {
      height = 0.85,
      width = 0.85,
      row = 0.5,
      col = 0.5,
      border = 'rounded',
      preview = {
        default = 'bat',
        wrap = 'wrap',
        hidden = 'nohidden',
        delay = 100,
        vertical = 'up:30%',
        horizontal = 'right:50%',
        layout = 'vertical',
        border = 'rounded',
      },
    },
    fzf_opts = {
      ['--ansi'] = '',
      ['--info'] = 'inline',
      ['--height'] = '100%',
      ['--layout'] = 'reverse',
    },
    files = {
      git_icons_enabled = true,
    },
  },
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Files' },
    { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Git Files' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
    { '<leader>fB', '<cmd>FzfLua builtin<cr>', desc = 'Builtin' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Tags' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = 'Grep Cword' },
    { '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', desc = 'Grep CWORD' },
    { '<leader>fS', '<cmd>FzfLua grep_curbuf<cr>', desc = 'Grep Curbuf' },
    { '<leader>ft', '<cmd>FzfLua filetypes<cr>', desc = 'Filetypes' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', desc = 'Oldfiles' },
    { '<leader>fr', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    { '<leader>fR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>fT', '<cmd>FzfLua tags<cr>', desc = 'Tags' },
    { '<leader>fG', '<cmd>FzfLua git_status<cr>', desc = 'Git Status' },
  },
}
