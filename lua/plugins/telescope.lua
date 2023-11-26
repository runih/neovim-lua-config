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
      'nvim-lua/plenary.nvim',
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

      local myfunctions_loaded, myfunctions = pcall(require, "core.functions")
      if not myfunctions_loaded then
        print("My functions not loaded!")
        return
      end

      local function change_colorschema(colorschema)
        vim.cmd("colorscheme " .. colorschema)
        if vim.g.neovide then
          local normal_highlight = vim.api.nvim_get_hl_by_name("Normal", true)
          if normal_highlight and normal_highlight.background then
            vim.g.neovide_background_color = string.format("%06x", (normal_highlight.background)) .. string.format("%x", (255 * vim.g.transparency))
          end
        end
      end

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "venv",
            ".venv",
            "__pycache__"
          },
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
              n = {
                ["a"] = function ()
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<tab>"] = function (prompt_bufnr, map)
                  actions.move_selection_next(prompt_bufnr)
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<s-tab>"] = function (prompt_bufnr)
                  actions.move_selection_previous(prompt_bufnr)
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["t"] = function ()
                  if vim.g.transparency then
                    vim.g.transparency = vim.g.transparency + 0.02
                    if vim.g.transparency > 1 then
                      vim.g.transparency = 1
                    end
                  end
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<S-t>"] = function ()
                  if vim.g.transparency then
                    vim.g.transparency = vim.g.transparency - 0.02
                    if vim.g.transparency < 0 then
                      vim.g.transparency = 0
                    end
                  end
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["b"] = function()
                  myfunctions.toggle_background()
                end,
              },
              i = {
                ["<C-a>"] = function ()
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<tab>"] = function (prompt_bufnr)
                  actions.move_selection_next(prompt_bufnr)
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<s-tab>"] = function (prompt_bufnr)
                  actions.move_selection_previous(prompt_bufnr)
                  local entry = action_state.get_selected_entry()
                  if entry then
                    change_colorschema(entry[1])
                  end
                end,
                ["<C-b>"] = function()
                  myfunctions.toggle_background()
                end,
              }
            }
          }
        }
      })
    end
  },

}
