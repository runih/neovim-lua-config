return {
  'runih/colorscheme-picker.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  dev = true,
  config = function()
    local ok, colorscheme = pcall(require, 'colorscheme-picker')
    if not ok then
      print('Color Picker is not loaded')
      return
    end
    colorscheme.setup({
      default_colorscheme = 'bamboo',
      keymapping = '<leader>cs',
    })
    colorscheme.set_default_colorscheme()
  end,
}
