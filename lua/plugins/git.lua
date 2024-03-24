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
    local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
    if not gitsigns_ok then
      return
    end

    gitsigns.setup()

    local neogit_ok, neogit = pcall(require, 'neogit')
    if not neogit_ok then
      return
    end

    neogit.setup({})
  end,
}
