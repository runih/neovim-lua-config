return {
  'runih/colorscheme-picker.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  dev = true,
  keys = {
    {
      '<leader>bt',
      mode = { 'n' },
      function()
        require('colorscheme-picker').toggle_background()
      end,
      desc = '[B]ackground [T]toggle',
    },
  },
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
