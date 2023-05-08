require("lazy-setup")
require("core.options")
require("core.keymaps")
require("core.colorschema")
require("core.globals")
if vim.g.neovide then
  require("core.neovide")
elseif vim.fn.has("gui_vimr") then
  require("core.vimr")
end
