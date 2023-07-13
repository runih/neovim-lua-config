local ok, _ = pcall(vim.cmd, "colorscheme bamboo")
if not ok then
  return
end
