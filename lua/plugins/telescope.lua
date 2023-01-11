return {
  -- fuzzy finding
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },

  config = function()
    local telescope_setup, telescope = pcall(require, "telescope")
    if not telescope_setup then
      return
    end

    local actions_setup, actions = pcall(require, "telescope.actions")
    if not actions_setup then
      return
    end

    local action_state_status, action_state = pcall(require, "telescope.actions.state")
    if not action_state_status then
      return
    end

    telescope.setup({
      defaults = {
        prompt_prefix = "$ ",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-a>"] = function ()
              print(vim.inspect(action_state.get_selected_entry()))
            end
          }
        }
      }
    })

    telescope.load_extension("fzf")
  end
}
