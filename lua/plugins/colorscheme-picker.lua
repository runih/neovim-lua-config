return {
  'runih/colorscheme-picker.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  dev = true,
  config = function()
    local colorscheme_loaded, colorscheme = pcall(require, 'colorscheme-picker')
    if colorscheme_loaded then
      colorscheme.setup({
        default_colorscheme = 'bamboo',
        keymapping = '<leader>cs',
      })
      colorscheme.set_default_colorscheme()
    end
  end,
}
