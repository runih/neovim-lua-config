-- Return a table defining the Copilot plugin configuration
return {
  -- Specify the Copilot plugin repository
  'github/copilot.vim',
  config = function()
    -- Disable default tab mapping for Copilot
    vim.g.copilot_no_tab_map = true

    -- Assume Copilot key mappings are already set
    vim.g.copilot_assume_mapped = true

    -- Set the Copilot model to the default configuration
    vim.g.copilot_model = 'default'

    -- Map <C-e> in insert mode to accept Copilot suggestions
    vim.keymap.set(
      'i', -- Mode: Insert
      '<C-e>', -- Key combination
      'copilot#Accept("<CR>")', -- Copilot function to accept suggestion
      { expr = true, silent = true, replace_keycodes = false } -- Keymap options
    )
  end,
}
