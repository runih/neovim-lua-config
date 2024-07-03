return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'LukasPietzschmann/telescope-tabs',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope_loaded, telescope = pcall(require, 'telescope')
      local actions_loaded, actions = pcall(require, 'telescope.actions')
      local action_state_loaded, action_state =
        pcall(require, 'telescope.actions.state')

      if telescope_loaded and actions_loaded and action_state_loaded then
        telescope.setup({
          defaults = {
            path_display = { 'smart' },
            file_ignore_patterns = {
              '.git/',
              'node_modules/',
              'venv',
              '.venv',
              '__pycache__',
            },
            winblend = 10,
            mappings = {
              i = {
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,

                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-q>'] = actions.send_selected_to_qflist
                  + actions.open_qflist,
                ['<C-a>'] = function()
                  print(vim.inspect(action_state.get_selected_entry()))
                end,
              },
            },
          },
          pickers = {},
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown({}),
            },
          },
        })
        telescope.load_extension('ui-select')
        telescope.load_extension('fzf')
      end
    end,
  },
}
