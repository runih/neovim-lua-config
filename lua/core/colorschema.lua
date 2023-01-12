local ok, _ = pcall(vim.cmd, "colorscheme nightfly")
if not ok then
  return
end
