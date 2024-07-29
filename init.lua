require('lazy-setup')
require('core.options')
require('core.keymaps')
require('core.globals')
require('core.autocmd')
if vim.g.neovide then
  require('core.neovide')
elseif vim.g.gui_vimr then
  require('core.vimr')
end

-- Local configuration
local local_config_loaded, local_config = pcall(require, 'local')
if local_config_loaded then
  local_config.setup()
end
