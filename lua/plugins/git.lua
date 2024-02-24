return {
  'NeogitOrg/neogit',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'kdheepak/lazygit.nvim',
    'tanvirtin/vgit.nvim',
  },

  config = function()
    local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
    if not gitsigns_ok then
      return
    end

    gitsigns.setup()

    if not vim.fn.has('gui_vimr') then
      -- Seems like neogit doesn't works with VimR
      local neogit_ok, neogit = pcall(require, 'neogit')
      if not neogit_ok then
        return
      end

      neogit.setup({})
    end

    local vgit_ok, vgit = pcall(require, 'vgit')
    if not vgit_ok then
      return
    end

    vgit.setup()
  end,
}
