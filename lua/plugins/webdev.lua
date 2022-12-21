local css_status, css = pcall(require, "colorizer")
if not css_status then
  return
end

css.setup()
