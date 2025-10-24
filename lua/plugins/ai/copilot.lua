-- Return a table defining the Copilot plugin configuration
return {
  -- Specify the Copilot plugin repository
  'github/copilot.vim',
  lazy = false, -- Load the plugin lazily
  init = function()
    -- Disable default tab mapping for Copilot
    vim.g.copilot_no_tab_map = true
    -- Assume Copilot key mappings are already set
    vim.g.copilot_assume_mapped = true
    -- Set the Copilot model to the default configuration
    vim.g.copilot_model = 'default'
  end,
  -- Map <C-e> in insert mode to accept Copilot suggestions
  keys = {
    {
      '<C-e>',
      'copilot#Accept("<CR>")',
      mode = 'i',
      expr = true,
      silent = true,
      replace_keycodes = false,
      desc = 'Copilot Accept Suggestion',
    },
  },
}
