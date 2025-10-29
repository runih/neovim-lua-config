return {
  -- treesitter
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'neovim/tree-sitter-vimdoc',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/playground',
  },
  opts = {
    modules = {},
    sync_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {},
    auto_install = true,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-s>',
        node_incremental = '<C-s>',
        scope_inccremental = false,
        node_decremental = '<bs>',
      },
    },
  }
}
