return {
  -- Vue Language Server configuration
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "package.json", "vue.config.js", ".git" },
}
