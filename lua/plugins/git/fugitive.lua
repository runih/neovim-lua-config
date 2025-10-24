return {
  "tpope/vim-fugitive",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  config = function()
    -- Optional: Set up any custom keybindings or configurations here
    vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", { noremap = true, silent = true })
  end,
}
