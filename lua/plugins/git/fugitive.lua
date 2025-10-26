return {
  "tpope/vim-fugitive",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    {
      "<leader>gs",
      mode = { "n" },
      "<cmd>G<CR>",
      {
        desc = "[G]it [S]tatus",
        noremap = true,
        silent = true
      },
    },
  },
}
