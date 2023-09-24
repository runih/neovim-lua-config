require("lazy-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("core.globals")
require("core.autocmd")
if vim.g.neovide then
  require("core.neovide")
elseif vim.fn.has("gui_vimr") then
  require("core.vimr")
end
