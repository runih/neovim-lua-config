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
    if gitsigns_loaded then
      gitsigns.setup()
    end

    local neogit_loaded, neogit = pcall(require, 'neogit')
    if neogit_loaded then
      neogit.setup({})
    end

    local blame_loaded, blame = pcall(require, 'blame')
    if blame_loaded then
      blame.setup()
    end
  end,
}
