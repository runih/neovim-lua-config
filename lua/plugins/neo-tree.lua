return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<c-e>',
      mode = { 'n' },
      function()
        local myfunctions_loaded, myfunctions = pcall(require, 'core.functions')
        if myfunctions_loaded then
          myfunctions.open_neotree()
        end
      end,
      desc = 'Open N[E]oTree',
    },
    {
      '<leader>ee',
      mode = { 'n' },
      '<cmd>Neotree toggle left<CR>',
      desc = 'Toggle left NeoTree',
    },
    {
      '<leader>ef',
      mode = { 'n' },
      '<cmd>Neotree toggle float<CR>',
      desc = 'Toggle float NeoTree',
    },
    {
      '<leader>er',
      mode = { 'n' },
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
            vim.cmd('Neotree focus filesystem left')
          end,
          ['2'] = function()
            vim.cmd('Neotree focus buffers left')
          end,
          ['3'] = function()
            vim.cmd('Neotree focus git_status left')
          end,
        },
      },
      default_component_configs = {
        icon = {
          default = '', -- Example icon for files
          folder_open = '', -- Icon for opened folders
          folder_closed = '', -- Icon for closed folders
          folder_empty = '󰜌',
          folder_empty_open = '󰜌',
          use_filtered_colors = false, -- Or true, depending on your preference
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
        truncation_character = "…", -- Character to indicate truncation
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
