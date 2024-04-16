return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local ok, alpha = pcall(require, 'alpha')
    if not ok then
      return
    end

    local theme_ok, theme = pcall(require, 'alpha.themes.startify')
    if not theme_ok then
      return
    end

    alpha.setup(theme.config)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
