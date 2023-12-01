return {
	"uga-rosa/ccc.nvim",
	config = function()
		-- Keymappings
		vim.keymap.set("n", "<leader>ccc", "<cmd>CccPick<CR>", { desc = "[C]reate [C]olor [C]ode Pick" })
		vim.keymap.set("n", "<leader>ccC", "<cmd>CccConvert<CR>", { desc = "[C]reate [C]olor [C]ode Convert" })
	end,
}
