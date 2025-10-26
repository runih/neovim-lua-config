return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'tpope/vim-rhubarb',
    { 'FabijanZulj/blame.nvim',  opts = {} },
    { 'f-person/git-blame.nvim', opts = {} },
  },
  opts = {},
  keys = {
    { '<leader>gn', mode = 'n', '<cmd>Neogit<CR>',              desc = 'NeoGit' },
    { '<leader>gb', mode = 'n', '<cmd>BlameToggle virtual<CR>', desc = 'Git Blame' },
  },
}
