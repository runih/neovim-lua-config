return {
  'folke/flash.nvim',
  lazy = true,
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>s", mode = { "n", "x", "o" }, '<cmd>lua require("flash").jump()<cr>',              desc = "Flash" },
    { "<leader>S", mode = { "n", "x", "o" }, '<cmd>lua require("flash").treesitter()<cr>',        desc = "Flash Treesitter" },
    { "<leader>r", mode = { "o" },           '<cmd>lua require("flash").remote()<cr>',            desc = "Remote Flash" },
    { "<leader>R", mode = { "o", "x" },      '<cmd>lua require("flash").treesitter_search()<cr>', desc = "Treesitter Search" },
    { "<c-s>",     mode = { "c" },           '<cmd>lua require("flash").toggle()<cr>',            desc = "Toggle Flash Search" },
  },
}
