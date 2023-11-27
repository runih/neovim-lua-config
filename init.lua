require("lazy-setup")
require("core.options")
require("core.keymaps")
require("core.globals")
require("core.autocmd")
if vim.g.neovide then
	require("core.neovide")
elseif vim.fn.has("gui_vimr") then
	require("core.vimr")
end
local colorscheme_loaded, colorscheme = pcall(require, "core.colorscheme")
if colorscheme_loaded then
	colorscheme.set_default_colorscheme()
end
