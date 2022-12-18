local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "graphql",
    "help",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "svelte",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  auto_install = true
})
