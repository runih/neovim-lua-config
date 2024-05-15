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
    if not gitsigns_loaded then
      return
    end

    gitsigns.setup()

    local neogit_loaded, neogit = pcall(require, 'neogit')
    if not neogit_loaded then
      return
    end

    neogit.setup({})

    local blame_loaded, blame = pcall(require, 'blame')
    if not blame_loaded then
      return
    end

    blame.setup()
  end,
}
