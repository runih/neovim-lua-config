return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  config = true,
  dependencies = {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'kdheepak/lazygit.nvim',
    'NeogitOrg/neogit',
    'tanvirtin/vgit.nvim',
  },

  config = function()
    local gitsigns_ok, gitsigns = pcall(require , "gitsigns")
    if not gitsigns_ok then
      return
    end

    gitsigns.setup()

    local neogit_ok, neogit = pcall(require, "neogit")
    if not neogit_ok then
      return
    end

    neogit.setup()

    local vgit_ok, vgit = pcall(require, "vgit")
    if not vgit_ok then
      return
    end

    vgit.setup()
  end
}
