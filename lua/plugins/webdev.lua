return {
  -- css
  'norcalli/nvim-colorizer.lua',
  config = function()
    vim.opt.termguicolors = true
    local ok, css = pcall(require, "colorizer")
    if not ok then
      return
    end

    css.setup()
  end
}
