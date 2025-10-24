-- Return a table defining the Copilot plugin configuration
return {
  -- Specify the Copilot plugin repository
  'github/copilot.vim',
  lazy = false, -- Load the plugin lazily
  config = function()
    -- Disable default tab mapping for Copilot
    vim.g.copilot_no_tab_map = true

    -- Assume Copilot key mappings are already set
    vim.g.copilot_assume_mapped = true

    -- Set the Copilot model to the default configuration
    vim.g.copilot_model = 'default'

    -- Map <C-e> in insert mode to accept Copilot suggestions
    vim.keymap.set(
      'i',                                                     -- Mode: Insert
      '<C-e>',                                                 -- Key combination
      'copilot#Accept("<CR>")',                                -- Copilot function to accept suggestion
      { expr = true, silent = true, replace_keycodes = false } -- Keymap options
    )

    -- Make sure the copilot chat window has markdown as the default filetype
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'copilot-chat',
      callback = function()
        vim.opt_local.filetype = 'markdown'
      end,
    })
  end,
}
