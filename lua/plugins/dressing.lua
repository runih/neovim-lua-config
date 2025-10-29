return {
  'stevearc/dressing.nvim',
  lazy = true,
  opts = {
    input = {
      enabled = true,
      default_prompt = "Input: ",
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "fzf_lua", "builtin" },
      builtin = {
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    builtin = {
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
}
