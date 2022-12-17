local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorschema 'nightfly' not found!")
  return
end
