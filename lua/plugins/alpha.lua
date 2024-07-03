return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha_loaded, alpha = pcall(require, 'alpha')
    local theme_loaded, theme = pcall(require, 'alpha.themes.startify')

    if alpha_loaded and theme_loaded then
      alpha.setup(theme.config)

      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
  end,
}
