-- Load core configurations
require('core.options') -- General options and settings
require('core.globals') -- Global variables
--
-- Load the lazy.nvim plugin manager setup
require('lazy-setup')

-- Continue loading core configurations after plugins are set up
require('core.keymaps') -- Key mappings
require('core.autocmd') -- Autocommands
require('core.lsp')     -- Language Server Protocol configurations


-- GUI-specific configurations
if vim.g.neovide then
  -- Load Neovide-specific settings
  require('core.neovide')
elseif vim.g.gui_vimr then
  -- Load VimR-specific settings
  require('core.vimr')
end

-- Local configuration
-- Attempt to load a user-specific local configuration file
local local_config_loaded, local_config = pcall(require, 'local')
if local_config_loaded then
  -- If the local configuration is successfully loaded, set it up
  local_config.setup()
end
