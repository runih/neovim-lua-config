return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'LukasPietzschmann/telescope-tabs',
      'nvim-telescope/telescope-ui-select.nvim',
      'folke/todo-comments.nvim',
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

        -- Extensions
        telescope.load_extension('ui-select')
        telescope.load_extension('fzf')

        -- Keymappings
        local keymap = vim.keymap
        local builtin_loaded, builtin = pcall(require, 'telescope.builtin')
        local myfunctions_loaded, myfunctions = pcall(require, 'core.functions')
        if myfunctions_loaded and builtin_loaded then
          keymap.set(
            'n',
            '<leader>R',
            builtin.registers,
            { desc = '[R]egisters' }
          )
          keymap.set(
            'n',
            '<leader>sB',
            builtin.builtin,
            { desc = '[S]earch Telescope [B]uiltin' }
          )
          keymap.set(
            'n',
            '<leader><space>',
            builtin.buffers,
            { desc = '[ ] Find existing buffers' }
          )
          keymap.set(
            'n',
            '<leader>fo',
            builtin.oldfiles,
            { desc = '[F]ind recently [o]ld files' }
          )
          keymap.set(
            'n',
            '<leader>ff',
            builtin.find_files,
            { desc = '[S]earch [F]iles' }
          )
          keymap.set(
            'n',
            '<leader>ft',
            builtin.filetypes,
            { desc = '[S]search [T]ypes' }
          )
          keymap.set(
            'n',
            '<leader>ht',
            builtin.help_tags,
            { desc = '[S]earch [H]elp' }
          )
          keymap.set(
            'n',
            '<leader>gs',
            builtin.grep_string,
            { desc = '[S]earch current [W]ord' }
          )
          keymap.set(
            'n',
            '<leader>lg',
            builtin.live_grep,
            { desc = '[S]earch by [G]rep' }
          )
          keymap.set(
            'n',
            '<leader>sd',
            builtin.diagnostics,
            { desc = '[S]earch [D]iagnostics' }
          )
          keymap.set(
            'n',
            '<leader>km',
            myfunctions.keymaps,
            { desc = '[K]ey[M]aps' }
          )
          keymap.set(
            'n',
            '<leader>/',
            myfunctions.find_in_current_buff,
            { desc = '[|] Search in current buffer' }
          )
          keymap.set(
            'n',
            '<leader>sn',
            myfunctions.nvim_config,
            { desc = '[S]earch [N]eoVim configurations' }
          )
          keymap.set(
            'n',
            '<leader>.',
            myfunctions.command_history,
            { desc = 'Command History' }
          )
          -- Git mappings
          keymap.set(
            'n',
            '<leader>GB',
            builtin.git_branches,
            { desc = '[G]it [B]ranches' }
          )
          keymap.set(
            'n',
            '<leader>Gc',
            builtin.git_commits,
            { desc = '[G]it [C]ommits' }
          )
          keymap.set(
            'n',
            '<leader>Gb',
            builtin.git_bcommits,
            { desc = '[G]it [B]uffer [C]ommits' }
          )
          keymap.set(
            'n',
            '<leader>Gs',
            builtin.git_status,
            { desc = '[G]it [S]tatus' }
          )
          keymap.set(
            'n',
            '<leader>GS',
            builtin.git_stash,
            { desc = '[G]it [S]tash' }
          )
          keymap.set(
            'n',
            '<leader>Gf',
            builtin.git_files,
            { desc = '[G]it [F]iles' }
          )
          keymap.set(
            'n',
            '<leader>ft',
            '<cmd>TodoTelescope<cr>',
            { desc = 'Find ToDos' }
          )
        end
      end
    end,
  },
}
