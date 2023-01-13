
local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("t", "<C-W><C-N>", "<C-\\><C-N>", {remap = true }) -- Map <ctrl w>+<ctrl n> to exit terminal mode

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- mine preferences
keymap.set("n", "<leader>init", ":tabedit ~/.config/nvim/init.lua<CR>|:lcd %:h<CR>")
keymap.set("n", "<leader>so", "<cmd>source %<CR>")
keymap.set("n", "<leader>cd", "<cmd>lcd %:h<CR>")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

-- telescope
keymap.set("n", "<leader>/", function()
  -- You can pass additional configuratiohn to telescope to change theme, layout, etc,
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>sgf", require("telescope.builtin").git_files, { desc = "[S]earch [G]it [F]iles" })
keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap.set("n", "<leader>km", require("telescope.builtin").keymaps, { desc = "[K]ey[M]aps"})
keymap.set("n", "<leader>st", require("telescope.builtin").filetypes, { desc = "[S]search [T]ypes"})

keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile", { desc = "Plenary[T]estFile"})

-- Alpha
keymap.set("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "[A]lpha" })

-- Mason
keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "[M]ason" })

-- LazyGit
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- debugging
keymap.set("n", "<F2>", "<cmd>lua require'dap'.continue()<CR>")
keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_into()<CR>")
keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_over()<CR>")
keymap.set("n", "<F5>", "<cmd>lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.open()<CR>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dapui'.close()<CR>")
