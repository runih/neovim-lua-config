return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local ok, lualine = pcall(require, 'lualine')
    if not ok then
      return
    end

    local lualine_nightfly_ok, lualine_nightfly =
      pcall(require, 'lualine.themes.nightfly')
    if not lualine_nightfly_ok then
      return
    end

    local new_colors = {
      blue = '#65D1FF',
      green = '#3EFFDC',
      violet = '#FF61EF',
      yellow = '#FFDA7B',
      black = '#000000',
    }

    lualine_nightfly.normal.a.bg = new_colors.blue
    lualine_nightfly.insert.a.bg = new_colors.green
    lualine_nightfly.visual.a.bg = new_colors.violet
    lualine_nightfly.command = {
      a = {
        gui = 'bold',
        bg = new_colors.yellow,
        fg = new_colors.black,
      },
    }

    lualine.setup({
      options = {
        theme = lualine_nightfly,
      },
    })
  end,
}
