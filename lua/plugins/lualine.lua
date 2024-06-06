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

    local function clock()
      if vim.g.neovide or vim.fn.has('gui_vimr') then
        return { 'datetime', style = '%H:%M' }
      end
    end

    lualine.setup({
      options = {
        theme = lualine_nightfly,
      },
      sections = {
        lualine_a = {
          'mode',
          'branch',
        },
        lualine_b = {
          {
            'diagnostics',

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_diagnostic', 'coc' },

            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = 'DiagnosticError', -- Changes diagnostics' error color.
              warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
              info = 'DiagnosticInfo', -- Changes diagnostics' info color.
              hint = 'DiagnosticHint', -- Changes diagnostics' hint color.
            },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
            colored = true, -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false, -- Show diagnostics even if there are none.
          },
        },
        lualine_c = {
          'filename',
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#FF9E64' },
          },
          {
            'diff',
            colored = false, -- Displays a colored diff status if set to true
            diff_color = {
              -- Same color values as the general color option can be used here.
              added = 'LuaLineDiffAdd', -- Changes the diff's added color
              modified = 'LuaLineDiffChange', -- Changes the diff's modified color
              removed = 'LuaLineDiffDelete', -- Changes the diff's removed color you
            },
            symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            source = nil, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
          },
          'filesize',
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_z = {
          'selectioncount',
          'location',
          clock(),
        },
      },
    })
  end,
}
