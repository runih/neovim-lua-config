return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'neovim/tree-sitter-vimdoc',
    }
  },
  'nvim-treesitter/playground',

  config = function()
    local ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    treesitter.setup({
      modules = {},
      sync_install = true,
      ignore_install = {},
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
        "volar",
        "vim",
        "vue",
        "yaml",
      },
      auto_install = true,
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        }
      }
    })
  end
}
