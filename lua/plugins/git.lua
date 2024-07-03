return {
  'NeogitOrg/neogit',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'kdheepak/lazygit.nvim',
    'FabijanZulj/blame.nvim',
    'f-person/git-blame.nvim',
  },
  event = 'VeryLazy',

  config = function()
    local gitsigns_loaded, gitsigns = pcall(require, 'gitsigns')
    local neogit_loaded, neogit = pcall(require, 'neogit')
    local blame_loaded, blame = pcall(require, 'blame')

    if gitsigns_loaded and neogit_loaded and blame_loaded then
      gitsigns.setup()
      neogit.setup({})
      blame.setup()
    end
  end,
}
