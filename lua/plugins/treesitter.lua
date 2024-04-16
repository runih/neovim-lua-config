return {
  -- treesitter
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'neovim/tree-sitter-vimdoc',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/playground',
  },

  config = function()
    local treesitter_loaded, treesitter =
      pcall(require, 'nvim-treesitter.configs')
    if not treesitter_loaded then
      return
    end

    treesitter.setup({
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
          init_selection = '<C-RETURN>',
          node_incremental = '<C-RETURN>',
          scope_inccremental = false,
          node_decremental = '<bs>',
        },
      },
    })
  end,
}
