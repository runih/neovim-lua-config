return {
  'uga-rosa/ccc.nvim',
  keys = {
    { '<leader>ccc', mode = 'n', '<cmd>CccPick<CR>',    desc = '[C]reate [C]olor [C]ode Pick' },
    { '<leader>ccC', mode = 'n', '<cmd>CccConvert<CR>', desc = '[C]reate [C]olor [C]ode Convert' },
  },
  config = function()
    local ccc_loaded, ccc = pcall(require, 'ccc')
    if ccc_loaded then
      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        pickers = {
          ccc.picker.ansi_escape({
            foreground = '#cccccc',
            background = '#0c0c0c',
            black = '#0c0c0c',
            red = '#c50f1f',
            green = '#13a10e',
            yellow = '#c19c00',
            blue = '#0037da',
            magenta = '#881798',
            cyan = '#3a96dd',
            white = '#cccccc',
            bright_black = '#767676',
            bright_red = '#e74856',
            bright_green = '#16c60c',
            bright_yellow = '#f9f1a5',
            bright_blue = '#3b78ff',
            bright_magenta = '#b4009e',
            bright_cyan = '#61d6d6',
            bright_white = '#f2f2f2',
          }, {
            -- `\e[31;1m` means whether `red + bold` or `bright red`.
            --        ---@type "bold"|"bright" Meaning of code 1. default: "bright"
            meaning1 = 'bright',
          }),
        },
      })
    end
  end,
}
