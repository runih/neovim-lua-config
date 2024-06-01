return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<leader>ee',
      '<cmd>Neotree toggle left<CR>',
      desc = 'Toggle left NeoTree',
    },
    {
      '<leader>ef',
      '<cmd>Neotree toggle float<CR>',
      desc = 'Toggle float NeoTree',
    },
    {
      '<leader>er',
      '<cmd>Neotree reveal<CR>',
      desc = 'Reveal NeoTree',
    },
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define(
      'DiagnosticSignError',
      { text = ' ', texthl = 'DiagnosticSignError' }
    )
    vim.fn.sign_define(
      'DiagnosticSignWarn',
      { text = ' ', texthl = 'DiagnosticSignWarn' }
    )
    vim.fn.sign_define(
      'DiagnosticSignInfo',
      { text = ' ', texthl = 'DiagnosticSignInfo' }
    )
    vim.fn.sign_define(
      'DiagnosticSignHint',
      { text = '', texthl = 'DiagnosticSignHint' }
    )

    local now_tree_loaded, neo_tree = pcall(require, 'neo-tree')
    if not now_tree_loaded then
      return
    end
    neo_tree.setup({
      popup_border_style = 'rounded',
      window = {
        mappings = {
          ['1'] = function()
            vim.api.nvim_exec('Neotree focus filesystem left', true)
          end,
          ['2'] = function()
            vim.api.nvim_exec('Neotree focus buffers left', true)
          end,
          ['3'] = function()
            vim.api.nvim_exec('Neotree focus git_status left', true)
          end,
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = '󰜌',
          folder_empty_open = '󰜌',
        },
        git_status = {
          symbols = {
            renamed = '󰁕',
            unstaged = '󰄱',
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = '󰈙', hl = 'Tag' },
          Namespace = { icon = '󰌗', hl = 'Include' },
          Package = { icon = '󰏖', hl = 'Label' },
          Class = { icon = '󰌗', hl = 'Include' },
          Property = { icon = '󰆧', hl = '@property' },
          Enum = { icon = '󰒻', hl = '@number' },
          Function = { icon = '󰊕', hl = 'Function' },
          String = { icon = '󰀬', hl = 'String' },
          Number = { icon = '󰎠', hl = 'Number' },
          Array = { icon = '󰅪', hl = 'Type' },
          Object = { icon = '󰅩', hl = 'Type' },
          Key = { icon = '󰌋', hl = '' },
          Struct = { icon = '󰌗', hl = 'Type' },
          Operator = { icon = '󰆕', hl = 'Operator' },
          TypeParameter = { icon = '󰊄', hl = 'Type' },
          StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        },
      },
      -- Add this section only if you've configured source selector.
      source_selector = {
        winbar = true,
        statusline = true,
        sources = {
          { source = 'filesystem', display_name = ' 󰉓 Files ' },
          { source = 'buffers', display_name = ' 󰈙 Buffers ' },
          { source = 'git_status', display_name = ' 󰊢 Git ' },
        },
      },
      vim.cmd([[nnoremap \ :Neotree reveal<cr>]]),
    })
  end,
}
