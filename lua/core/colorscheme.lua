local colorscheme = 'bamboo'
local f = io.open(vim.fn.expand("~/.config/nvim/colorscheme"), "r")
if f then
  colorscheme = f:read()
  f:close()
end

local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  return
end
