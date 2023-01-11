return {
  -- css
  'norcalli/nvim-colorizer.lua',
  config = function()
    vim.opt.termguicolors = true
    local css_status, css = pcall(require, "colorizer")
    if not css_status then
      return
    end

    css.setup()
  end
}
