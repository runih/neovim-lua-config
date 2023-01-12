return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "NeoTree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    }
  }
}
