return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local loaline_loaded, lualine = pcall(require, 'lualine')
    if not loaline_loaded then
      return
    end

    local lualine_nightfly_loaded, lualine_nightfly =
      pcall(require, 'lualine.themes.nightfly')
    if not lualine_nightfly_loaded then
      return
    end

    local lazy_status_loaded, lazy_status = pcall(require, 'lazy.status')
    if not lazy_status_loaded then
      return
    end

    local colors = {
      blue = '#65D1FF',
      green = '#3EFFDC',
      violet = '#FF61EF',
      yellow = '#FFDA7B',
      red = '#FF4A4A',
      black = '#000000',
      fg = '#C3CCDC',
      bg = '#112638',
      inactive_bg = '#2C3043',
    }

    lualine_nightfly.normal.a.bg = colors.blue
    lualine_nightfly.insert.a.bg = colors.green
    lualine_nightfly.visual.a.bg = colors.violet
    lualine_nightfly.command = {
      a = {
        gui = 'bold',
        bg = colors.yellow,
        fg = colors.black,
      },
    }

    lualine.setup({
      options = {
        theme = lualine_nightfly,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#FF9E64' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
    })
  end,
}
