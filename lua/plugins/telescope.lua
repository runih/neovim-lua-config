return {
  -- fuzzy finding
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        -- config = function ()
        --   local test_harness_ok, test_harness = pcall(require, "plenary.test_harness")
        --   if not test_harness_ok then
        --     return
        --   end

        --   test_harness.setup()
        -- end
      },
      'LukasPietzschmann/telescope-tabs'
    },
    config = function()
      local telescope_ok, telescope = pcall(require, "telescope")
      if not telescope_ok then
        return
      end

      local actions_ok, actions = pcall(require, "telescope.actions")
      if not actions_ok then
        return
      end

      local action_state_ok, action_state = pcall(require, "telescope.actions.state")
      if not action_state_ok then
        return
      end

      telescope.setup({
        defaults = {
          -- prompt_prefix = "$ ",
          winblend = 10,
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,


              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = function ()
                print(vim.inspect(action_state.get_selected_entry()))
              end
            }
          }
        },
        pickers = {
          colorscheme = {
            theme = 'dropdown',
            prompt_prefix = '  > ',
            previewer = false,
            winblend=10,
            mappings = {
              i = {
                ["<C-a>"] = function ()
                  local entry = action_state.get_selected_entry()
                  if entry then
                    vim.cmd("colorscheme " .. entry[1])
                  end
                end
              }
            }
          }
        }
      })

      telescope.load_extension("fzf")
    end
  },

}
