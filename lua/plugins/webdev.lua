return {
  -- css
  'norcalli/nvim-colorizer.lua',
  config = function()
    vim.opt.termguicolors = true
    local colorizer_loaded, colorizer = pcall(require, 'colorizer')
    if colorizer_loaded then
      colorizer.setup()
    end
  end,
}
